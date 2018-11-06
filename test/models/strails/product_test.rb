# frozen_string_literal: true

require "test_helper"

module Strails
  class ProductTest < ActiveSupport::TestCase
    setup do
      @product = strails_products(:default)
    end

    test "has valid fixtures" do
      Product.all.each do |product|
        assert product.valid?
      end
    end

    test "is invalid without a name" do
      product = Product.new

      assert product.invalid?
      assert_has_errors_on product, :name
    end

    test "builds a master variant" do
      product = Product.new(new_params)

      assert_not_nil product.master
    end

    test "responds to price and sku through master" do
      assert_respond_to @product, :price
      assert_equal @product.master.price, @product.price

      assert_respond_to @product, :sku
      assert_equal @product.master.sku, @product.sku
    end

    test "does not raise errors when created" do
      product = Product.create!(new_params)

      assert_not_nil product
    end

    test "generates variants when it receives option_values" do
      option_values = [strails_option_values(:type_one_value_one),
                       strails_option_values(:type_one_value_two),
                       strails_option_values(:type_two_value_three),
                       strails_option_values(:type_two_value_four)]

      product = Product.create!(new_params(option_values: option_values))

      assert_not_empty product.variants

      expected = [[strails_option_values(:type_one_value_one), strails_option_values(:type_two_value_three)],
                  [strails_option_values(:type_one_value_one), strails_option_values(:type_two_value_four)],
                  [strails_option_values(:type_one_value_two), strails_option_values(:type_two_value_three)],
                  [strails_option_values(:type_one_value_two), strails_option_values(:type_two_value_four)]]

      assert_equal expected, product.variants.map(&:option_values).map(&:to_a)
    end

    test "destroys variants when destroyed" do
      id = @product.id
      @product.destroy

      assert_equal 0, Variant.where(product_id: id).count
    end
  end
end
