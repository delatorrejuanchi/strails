require 'test_helper'

module Strails
  class OptionValueVariantTest < ActiveSupport::TestCase
    setup do
      @option_value_variant = strails_option_value_variants(:default)
    end

    def new_params(options = {})
      super.merge(option_value: strails_option_values(:default).dup, variant: strails_variants(:default).dup)
    end

    test "has valid fixtures" do
      OptionValueVariant.all.each do |option_value_variant|
        assert option_value_variant.valid?
      end
    end

    test "is invalid without option_value and variant" do
      option_value_variant = OptionValueVariant.new

      assert option_value_variant.invalid?
      assert_has_errors_on option_value_variant, :option_value, :variant
    end

    test "is invalid when it is a duplicate" do
      duplicate = @option_value_variant.dup

      assert duplicate.invalid?
    end

    test "does not raise errors when created" do
      option_value_variant = OptionValueVariant.create!(new_params)

      assert_not_nil option_value_variant
    end
  end
end
