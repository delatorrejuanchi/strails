# frozen_string_literal: true

require "test_helper"

module Strails
  class ProductTest < ActiveSupport::TestCase
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

    test "does not raise errors when created" do
      product = Product.create!(name: "Sample Product", description: "Description of Sample Product")

      assert_not_nil product
    end
  end
end
