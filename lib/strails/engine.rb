# frozen_string_literal: true

require "sass-rails"

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
