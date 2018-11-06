# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class VariantsControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      setup do
        @variant = strails_variants(:default)
        @product = @variant.product
      end

      test "should get index" do
        get backend_product_variants_path(@product)
        assert_response :success
      end

      test "should get new" do
        get new_backend_product_variant_path(@product)
        assert_response :success
      end

      test "should create variant" do
        option_value_ids = [strails_option_values(:type_one_value_one).id,
                            strails_option_values(:type_two_value_three).id]
        assert_difference("Strails::Variant.count") do
          post backend_product_variants_path(@product),
               params: { variant: { sku: "sample-product-ov2", price: 100, option_value_ids: option_value_ids } }
        end

        assert_redirected_to backend_product_variants_path(@product)
      end

      test "should redirect show variant to edit variant" do
        get backend_product_variant_path(@product, @variant)
        assert_redirected_to edit_backend_product_variant_path(@product, @variant)
      end

      test "should get edit" do
        get edit_backend_product_variant_path(@product, @variant)
        assert_response :success
      end

      test "should update variant" do
        patch backend_product_variant_path(@product, @variant),
              params: { variant: { sku: "edited-sample-product-ov1", price: 10 } }
        assert_redirected_to backend_product_variant_path(@product, @variant)
      end

      test "should destroy variant" do
        assert_difference("Strails::Variant.count", -1) do
          delete backend_product_variant_path(@product, @variant)
        end

        assert_redirected_to backend_product_variants_path(@product)
      end
    end
  end
end
