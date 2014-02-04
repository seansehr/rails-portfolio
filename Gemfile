source 'https://rubygems.org'

gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'rails', '4.0.0' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Gems used only for assets and not required
# in production environments by default.
# allow everywhere for now cause we are allowing asset debugging in prd
gem 'jquery-rails', '~> 2.3.0' # Use jquery as the JavaScript library
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
gem 'foundation-rails' # Use Foundations framework
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

group :development, :test do
  gem 'sqlite3' # Use sqlite3 as the database for Active Record, not supported on Heroku
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'turn'
end

group :production do
  gem 'pg' # Heroku database
  gem 'rails_12factor'
end

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api.
end