# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class DashboardControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      test "should get dashboard index" do
        get backend_dashboard_path
        assert_response :success
      end
    end
  end
end
