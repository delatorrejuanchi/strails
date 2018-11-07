# frozen_string_literal: true

module Strails
  class Variant < ApplicationRecord
    attr_accessor :destroyed_by_product

    belongs_to :product
    has_many :option_value_variants, dependent: :destroy, inverse_of: :variant
    has_many :option_values, through: :option_value_variants

    validates :product, presence: true
    validates :option_values, presence: { unless: :is_master }
    validates :is_master, inclusion: { in: [true, false] }
    validate :only_one_option_value_per_option_type

    before_save :set_default_sku
    before_save :set_default_price
    before_destroy :dont_unless_destroyed_by_product, if: :is_master, prepend: true

    delegate :name, :description, to: :product

    def option_value_from_option_type(option_type)
      option_values.find_by(option_type: option_type)
    end

    def option_types
      option_values.map(&:option_type)
    end

    def extra_price
      price - product.price
    end

    def price
      if is_master
        super
      else
        product.price + (super.nil? ? 0 : super)
      end
    end

    def price=(value)
      if is_master
        super((value.nil? ? 0 : value.to_d))
      else
        super((value.nil? ? 0 : value.to_d) - (product.nil? ? 0 : product.price))
      end
    end

    private

    def only_one_option_value_per_option_type
      return if option_types == option_types.uniq

      errors.add(:option_values,
                 :cant_add_more_than_one_option_value_of_the_same_option_type,
                 message: I18n.t("errors.cant_set_more_than_one_option_value_of_the_same_option_type"))
    end

    def set_default_sku
      self.sku ||= ([product.sku] + option_values.map(&:name)).join(" ").parameterize.downcase
    end

    def set_default_price
      self.price ||= is_master? ? 0 : product.price
    end

    def dont_unless_destroyed_by_product
      return if destroyed_by_product

      errors.add(:base, :cant_destroy_master_variant, message: I18n.t("errors.cant_destroy_master_variant"))
      throw(:abort)
    end
  end
end
