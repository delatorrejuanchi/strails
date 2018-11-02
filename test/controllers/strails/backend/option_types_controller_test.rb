# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class OptionTypesControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      setup do
        @option_type = strails_option_types(:default)
      end

      test "should get index" do
        get backend_option_types_url
        assert_response :success
      end

      test "should get new" do
        get new_backend_option_type_url
        assert_response :success
      end

      test "should create option_type" do
        assert_difference("Strails::OptionType.count") do
          post backend_option_types_url, params: { option_type: { name: "OT1", presentation: "Option Type 1" } }
        end

        assert_redirected_to backend_option_type_url(Strails::OptionType.last)
      end

      test "should redirect show option_type to edit option_type" do
        get backend_option_type_url(@option_type)
        assert_redirected_to edit_backend_option_type_url(@option_type)
      end

      test "should get edit" do
        get edit_backend_option_type_url(@option_type)
        assert_response :success
      end

      test "should update option_type" do
        patch backend_option_type_url(@option_type),
              params: { option_type: { name: "EOT1", presentation: "Edited Option Type 1" } }
        assert_redirected_to backend_option_type_url(@option_type)
      end

      test "should destroy option_type" do
        assert_difference("Strails::OptionType.count", -1) do
          delete backend_option_type_url(@option_type)
        end

        assert_redirected_to backend_option_types_url
      end
    end
  end
end
