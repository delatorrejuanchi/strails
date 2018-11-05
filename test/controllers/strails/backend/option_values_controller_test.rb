# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class OptionValuesControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      setup do
        @option_value = strails_option_values(:default)
        @option_type = @option_value.option_type
      end

      test "should get index" do
        get backend_option_type_option_values_path(@option_type)
        assert_response :success
      end

      test "should get new" do
        get new_backend_option_type_option_value_path(@option_type)
        assert_response :success
      end

      test "should create option_value" do
        assert_difference("Strails::OptionValue.count") do
          post backend_option_type_option_values_path(@option_type),
               params: { option_value: { name: "OV1", presentation: "Option Value 1" } }
        end

        assert_redirected_to backend_option_type_option_values_path(@option_type)
      end

      test "should redirect show option_value to edit option_value" do
        get backend_option_type_option_value_path(@option_type, @option_value)
        assert_redirected_to edit_backend_option_type_option_value_path(@option_type, @option_value)
      end

      test "should get edit" do
        get edit_backend_option_type_option_value_path(@option_type, @option_value)
        assert_response :success
      end

      test "should update option_value" do
        patch backend_option_type_option_value_path(@option_type, @option_value),
              params: { option_value: { name: "EOV1", presentation: "Edited Option Value 1" } }
        assert_redirected_to backend_option_type_option_value_path(@option_type, @option_value)
      end

      test "should destroy option_value" do
        assert_difference("Strails::OptionValue.count", -1) do
          delete backend_option_type_option_value_path(@option_type, @option_value)
        end

        assert_redirected_to backend_option_type_option_values_path(@option_type)
      end
    end
  end
end
