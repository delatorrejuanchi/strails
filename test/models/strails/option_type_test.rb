# frozen_string_literal: true

require "test_helper"

module Strails
  class OptionTypeTest < ActiveSupport::TestCase
    setup do
      @option_type = strails_option_types(:default)
    end

    test "has valid fixtures" do
      OptionType.all.each do |option_type|
        assert option_type.valid?
      end
    end

    test "is invalid without name and presentation" do
      option_type = OptionType.new

      assert option_type.invalid?
      assert_has_errors_on option_type, :name, :presentation
    end

    test "does not raise errors when created" do
      option_type = OptionType.create!(name: "size", presentation: "Size")

      assert_not_nil option_type
    end

    test "destroys option_values when destroyed" do
      id = @option_type.id
      @option_type.destroy

      assert_equal 0, OptionValue.where(option_type_id: id).count
    end
  end
end
