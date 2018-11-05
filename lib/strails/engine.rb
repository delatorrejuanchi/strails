# frozen_string_literal: true

require "sass-rails"
require "jquery-rails"
require "bootstrap"
require "active_link_to"
require "croutons"
require "rails-i18n"
require "cocoon"

module Strails
  class Engine < ::Rails::Engine
    isolate_namespace Strails

    initializer "strails.assets.precompile" do |app|
      app.config.assets.precompile += %w[strails/frontend.js
                                         strails/frontend.css
                                         strails/backend.js
                                         strails/backend.css]
    end

    initializer "strails.i18n.available_locales" do |app|
      app.config.i18n.available_locales = %i[en es]
    end
  end
end
