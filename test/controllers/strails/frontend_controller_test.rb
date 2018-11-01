# frozen_string_literal: true

require "test_helper"

module Strails
  class FrontendControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "controllers inside Strails::Frontend inherit from Strails::FrontendController" do
      files = Dir.glob(File.expand_path("app/controllers/strails/frontend/*_controller.rb", Engine.root))

      files.each do |file|
        klass = "Strails::Frontend::#{File.basename(file, '.rb').classify}".constantize
        assert_equal Strails::FrontendController, klass.superclass
      end
    end
  end
end
