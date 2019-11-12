# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
source "https://#{ENV['GEM_KEY']}@gems.trailblazer.to" do
  gem 'trailblazer-activity-implementation', '>= 0.0.3'
end

gem 'reform'
gem 'reform-rails'
gem 'trailblazer'
gem 'trailblazer-cells'
gem 'trailblazer-developer'
gem 'trailblazer-rails'

gem "font-awesome-rails"
gem 'bootstrap', '~> 4.3.1'
gem 'bcrypt', '~> 3.1.7'
gem 'haml'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.1.0'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors', require: 'rack/cors'

group :test do
  gem 'minitest-rails'
  gem 'minitest-rails-capybara', '3.0.1'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
end

group :development do
  gem 'faraday'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'multi_json'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
