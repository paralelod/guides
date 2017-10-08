echo "🐙 \033[1;34m Criando Gemfile para $theme \033[0m"

echo "
#selected theme: $theme

source 'https://rubygems.org'
# ruby RUBY_VERSION

gem 'jekyll'
gem '$theme', :path => './_theme/$theme/'

# If you want to use GitHub Pages, remove the ''gem jekyll'' above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem 'github-pages', group: :jekyll_plugins

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'jekyll-sitemap'
gem 'jekyll-feed'
gem 'jekyll-paginate'

#hologram styleguide generator
gem 'hologram'

" >> Gemfile

echo "🐙 \033[1;34m Gemfile done!!! \033[0m"

