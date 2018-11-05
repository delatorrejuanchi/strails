# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

group :development, :test do
  gem "puma"
  gem "sqlite3"

  gem "simplecov"
  gem "simplecov-console"

  gem "rubocop"

  gem "i18n-debug"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug"
  gem "web-console"
end
