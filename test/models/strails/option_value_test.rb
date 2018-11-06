# frozen_string_literal: true

require "test_helper"

module Strails
  class OptionValueTest < ActiveSupport::TestCase
    setup do
      @option_value = strails_option_values(:default)
    end

    test "has valid fixtures" do
      OptionValue.all.each do |option_value|
        assert option_value.valid?
      end
    end

    test "is invalid without name, presentation, and option_type" do
      option_value = OptionValue.new

      assert option_value.invalid?
      assert_has_errors_on option_value, :name, :presentation, :option_type
    end

    test "does not raise errors when created" do
      option_value = OptionValue.create!(new_params)

      assert_not_nil option_value
    end

    test "destroys option_value_variants when destroyed" do
      id = @option_value.id
      @option_value.destroy

      assert_equal 0, OptionValueVariant.where(option_value_id: id).count
    end
  end
end
