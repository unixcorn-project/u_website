config[:description] = 'Unixcorn.org, site web de licornes fanatiques. Hébergement et services web à prix libre mais non gratuit. Le tout propulsé par des technologies libres et respectueuses de votre vie privée.'

helpers do
  def page_title
    [
      ("layout.#{current_resource.data.title}" if current_resource.data.title),
      'site.title'
    ]
    .reject(&:blank?)
    .map{ |element| I18n.t(element) }.join(' - ') 
  end
end

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

locales = [:fr, :en]
activate :i18n, mount_at_root: locales[0], langs: locales

set :markdown_engine, :kramdown

# Adapted from https://github.com/middleman/middleman-blog/issues/343#issuecomment-383875168
locales.each_with_index do |locale, index|
  activate :blog do |blog|
    # Locale path: first locale is mounted at root
    path = index > 0 ? "#{locale}/" : ""
    blog.name = "blog_#{locale}"
    blog.permalink = "#{path}blog/{year}/{title}.html"

    blog.sources = "blog/#{locale}/{year}-{month}-{day}-{title}.html"
    blog.layout = "blog_layout"

    # Pagination
    blog.paginate  = true

    # Tags
    blog.tag_template = "blog/tag.html"
    blog.taglink      = "#{path}blog/tag/{tag}.html"
    # Use the global Middleman I18n.locale instead of the lang in the
    # article's frontmatter
    blog.preserve_locale = true
  end
end

activate :directory_indexes

activate :deploy do |deploy|
  deploy.deploy_method = :git
end
