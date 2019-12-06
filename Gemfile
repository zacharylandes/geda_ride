source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "omniauth-google-oauth2", "~> 0.2.1"
gem 'pry'
gem 'newrelic_rpm'
gem 'faker'
gem 'faraday'
gem 'carrierwave-aws'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'aws-sdk-rails'
gem 'redis-rails'
gem 'bootstrap', '~> 4.0.0'
gem 'figaro'
gem 'geokit-rails'
gem 'geocoder'
gem 'StreetAddress', :require => "street_address"
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'mailboxer'
gem 'webmock'
gem 'stripe'
gem 'will_paginate', '~> 3.1.0'
gem 'render_anywhere', :require => false

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'coveralls', require: false
  gem 'launchy'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'vcr', '2.2.5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
