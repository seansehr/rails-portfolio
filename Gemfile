source 'https://rubygems.org'

gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'rails', '4.0.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sqlite3' # Use sqlite3 as the database for Active Record
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Gems used only for assets and not required
# in production environments by default.
# allow everywhere for now cause we are allowing asset debugging in prd
group :assets do
  gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
  gem 'jquery-rails' # Use jquery as the JavaScript library
  gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
  gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
end

group :test, :development do
  gem 'minitest-rails'
  gem "minitest-rails-capybara"
end

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api.
end