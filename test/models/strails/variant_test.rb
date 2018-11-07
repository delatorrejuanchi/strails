# frozen_string_literal: true

require "test_helper"

module Strails
  class VariantTest < ActiveSupport::TestCase
    setup do
      @variant = strails_variants(:default)
      @master_variant = strails_variants(:default_master)
    end

    def new_params(options = {})
      super.merge(option_values: @variant.option_values).merge(options)
    end

    test "has valid fixtures" do
      Variant.all.each do |variant|
        assert variant.valid?
      end
    end

    test "is invalid without is_master, product, and option_values" do
      variant = Variant.new

      assert variant.invalid?
      assert_has_errors_on variant, :is_master, :product, :option_values
    end

    test "is invalid without product if is_master" do
      variant = Variant.new(is_master: true)

      assert variant.invalid?
      assert_has_errors_on variant, :product
    end

    test "is invalid if it has more than one option value of the same option type" do
      option_values = [strails_option_values(:type_one_value_one), strails_option_values(:type_one_value_two)]
      variant = Variant.new(new_params(option_values: option_values))

      assert variant.invalid?
      assert_has_errors_on variant, :option_values
    end

    test "sets default sku and price" do
      variant = Variant.create!(new_params(sku: nil, price: nil))

      assert_not_nil variant.sku
      assert_not_nil variant.price
    end

    test "does not raise errors when created" do
      variant = Variant.create!(new_params)

      assert_not_nil variant
    end

    test "responds to name and description through product" do
      assert_respond_to @variant, :name
      assert_equal @variant.product.name, @variant.name

      assert_respond_to @variant, :description
      assert_equal @variant.product.description, @variant.description
    end

    test "can't be destroyed if is_master unless destroyed_by_product" do
      assert_not @master_variant.destroy
    end

    test "destroys option_value_variants when destroyed" do
      id = @variant.id
      @variant.destroy

      assert_equal 0, OptionValueVariant.where(variant_id: id).count
    end
  end
end
