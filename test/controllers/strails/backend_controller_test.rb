# frozen_string_literal: true

require "test_helper"

module Strails
  class BackendControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "controllers inside Strails::Backend inherit from Strails::BackendController" do
      files = Dir.glob(File.expand_path("app/controllers/strails/backend/*_controller.rb", Engine.root))

      files.each do |file|
        klass = "Strails::Backend::#{File.basename(file, '.rb').classify}".constantize
        assert_equal Strails::BackendController, klass.superclass
      end
    end
  end
end
