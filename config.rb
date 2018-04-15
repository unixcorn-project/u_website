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

activate :i18n, mount_at_root: :fr, langs: [:fr, :en]

set :markdown_engine, :kramdown

activate :blog do |blog|
  blog.sources = "blog/{lang}/{year}-{month}-{day}-{title}.html"
  blog.permalink = "blog/{year}/{title}.html"

  blog.layout = "blog_layout"
  blog.taglink = "blog/tag/{tag}"
  blog.tag_template = "blog/tag.html"
  blog.paginate = true
end

activate :directory_indexes

activate :deploy do |deploy|
  deploy.deploy_method = :git
end
