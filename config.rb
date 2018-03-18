config[:description] = 'Unixcorn.org, site web de licornes fanatiques. Hébergement et services web à prix libre mais non gratuit. Le tout propulsé par des technologies libres et respectueuses de votre vie privée.'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

set :markdown_engine, :kramdown

activate :blog do |blog|
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.permalink = "blog/{year}/{title}.html"

  blog.layout = "blog_layout"
end

activate :directory_indexes