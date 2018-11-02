# frozen_string_literal: true

require "test_helper"

module Strails
  module Backend
    class ProductsControllerTest < ActionDispatch::IntegrationTest
      include Engine.routes.url_helpers

      setup do
        @product = strails_products(:default)
      end

      test "should get index" do
        get backend_products_url
        assert_response :success
      end

      test "should get new" do
        get new_backend_product_url
        assert_response :success
      end

      test "should create product" do
        assert_difference("Strails::Product.count") do
          post backend_products_url,
               params: { product: { name: "Sample Product", description: "Description of Sample Product" } }
        end

        assert_redirected_to backend_product_url(Strails::Product.last)
      end

      test "should redirect show product to edit product" do
        get backend_product_url(@product)
        assert_redirected_to edit_backend_product_url(@product)
      end

      test "should get edit" do
        get edit_backend_product_url(@product)
        assert_response :success
      end

      test "should update product" do
        patch backend_product_url(@product),
              params: { product: { name: "Edited Sample Product",
                                   description: "Edited description of Sample Product" } }
        assert_redirected_to backend_product_url(@product)
      end

      test "should destroy product" do
        assert_difference("Strails::Product.count", -1) do
          delete backend_product_url(@product)
        end

        assert_redirected_to backend_products_url
      end
    end
  end
end
