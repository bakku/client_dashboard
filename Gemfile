# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 6.1.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "jbuilder", "~> 2.5"
gem "pg", "~> 1.2"
gem "puma", "~> 3.12"

gem "bootstrap", "~> 4.3.1"
gem "coffee-rails", "~> 5.0"
gem "dropzonejs-rails", "~> 0.8"
gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

gem "faker"
gem "roo", "~> 2.8.0"
gem "simple_token_generator", github: "nicosticht/simple_token_generator"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 4.0"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
