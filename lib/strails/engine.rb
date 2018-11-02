# frozen_string_literal: true

require "sass-rails"
require "jquery-rails"
require "bootstrap"
require "active_link_to"
require "croutons"

module Strails
  class Engine < ::Rails::Engine
    isolate_namespace Strails

    initializer "strails.assets.precompile" do |app|
      app.config.assets.precompile += %w[strails/frontend.js
                                         strails/frontend.css
                                         strails/backend.js
                                         strails/backend.css]
    end
  end
end
