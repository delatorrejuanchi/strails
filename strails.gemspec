# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "strails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "strails"
  s.version     = Strails::VERSION
  s.authors     = ["Juan Cruz de La Torre"]
  s.email       = ["delatorrejuanchi@gmail.com"]
  s.homepage    = "https://github.com/delatorrejuanchi/strails"
  s.summary     = "Full-stack e-commerce framework for Rails."
  s.description = "Strails is a full-stack e-commerce framework for developing online stores using Ruby on Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "active_link_to"
  s.add_dependency "bootstrap"
  s.add_dependency "croutons"
  s.add_dependency "jquery-rails"
  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "rails-i18n"
  s.add_dependency "sass-rails"
end
