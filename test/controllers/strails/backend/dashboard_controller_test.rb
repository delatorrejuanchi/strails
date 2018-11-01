# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class DashboardControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      test "should get backend root" do
        get backend_root_url
        assert_response :success
      end
    end
  end
end
