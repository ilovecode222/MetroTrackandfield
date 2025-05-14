source "https://rubygems.org"

ruby "3.3.4"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"

# PostgreSQL for all environments
gem "pg", "~> 1.4"

# For encrypting passwords
gem "bcrypt", "3.1.20"

# The original asset pipeline for Rails
gem "sprockets-rails"

# Web server
gem "puma", ">= 5.0"

# JavaScript with ESM import maps
gem "importmap-rails"

# Hotwire
gem "turbo-rails"
gem "stimulus-rails"

# Build JSON APIs
gem "jbuilder"

# Windows-specific timezone data
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times
gem "bootsnap", require: false

# Bootstrap, Sass, jQuery
gem "bootstrap", "~> 5.3.3"
gem "sassc-rails"
gem "jquery-rails"

# Development and test
group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
