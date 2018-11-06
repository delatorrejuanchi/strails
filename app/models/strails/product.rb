# frozen_string_literal: true

module Strails
  class Product < ApplicationRecord
    attr_accessor :option_values

    with_options class_name: "Strails::Variant", inverse_of: :product do
      has_many :variants_including_master, dependent: :destroy
      has_many :variants, -> { where(is_master: false) }
      has_one :master, -> { where(is_master: true) }
    end

    validates :name, :master, presence: true

    after_initialize :build_master, unless: :master
    after_create :generate_variants, if: :option_values
    before_destroy :set_destroyed_by_product_in_variants, prepend: true

    delegate :sku, :price, to: :master

    accepts_nested_attributes_for :master

    def option_types
      variants.map(&:option_types).flatten.uniq
    end

    private

    def generate_variants
      combinations = generate_option_value_combinations(option_values)

      combinations.each do |combination|
        variants.create(option_values: combination)
      end
    end

    def generate_option_value_combinations(option_values)
      grouped = option_values.group_by(&:option_type).values

      return option_values.map { |ov| [ov] } if grouped.size == 1

      grouped.inject(grouped.shift) do |memo, value|
        memo.product(value).map(&:flatten)
      end
    end

    def set_destroyed_by_product_in_variants
      variants_including_master.each do |variant|
        variant.destroyed_by_product = true
      end
    end
  end
end
