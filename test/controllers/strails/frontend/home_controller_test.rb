# frozen_string_literal: true

require "test_helper"

module Strails
  module Frontend
    class HomeControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      test "should get root" do
        get root_url
        assert_response :success
      end
    end
  end
end
