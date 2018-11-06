module Strails
  class Variant < ApplicationRecord
    attr_accessor :destroyed_by_product

    belongs_to :product, class_name: "Strails::Product"
    has_many :option_value_variants,
             class_name: "Strails::OptionValueVariant",
             dependent: :destroy,
             inverse_of: :variant
    has_many :option_values, through: :option_value_variants, class_name: "Strails::OptionValue"

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

    private

    def set_default_sku
      return if sku.present?

      self.sku = ([product.sku] + option_values.map(&:name)).join(" ").parameterize.downcase
    end

    def set_default_price
      return if price.present?

      self.price = 0
    end

    def only_one_option_value_per_option_type
      return if option_types == option_types.uniq

      errors.add(:base,
                 :cant_add_more_than_one_option_value_of_the_same_option_type,
                 message: I18n.t("errors.cant_set_more_than_one_option_value_of_the_same_option_type"))
    end

    def dont_unless_destroyed_by_product
      return if destroyed_by_product

      errors.add(:base, :cant_destroy_master_variant, message: I18n.t("errors.cant_destroy_master_variant"))
      throw(:abort)
    end
  end
end
