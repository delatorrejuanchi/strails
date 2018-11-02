# frozen_string_literal: true

require "test_helper"

module Strails
  class OptionValueTest < ActiveSupport::TestCase
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
      option_value = OptionValue.create!(name: "L", presentation: "Large", option_type: strails_option_types(:default))

      assert_not_nil option_value
    end
  end
end
