# frozen_string_literal: true

module Strails
  class OptionValueVariant < ApplicationRecord
    belongs_to :option_value, class_name: "Strails::OptionValue", inverse_of: :option_value_variants
    belongs_to :variant, class_name: "Strails::Variant", inverse_of: :option_value_variants

    validates :option_value, :variant, presence: true
    validates :option_value_id, uniqueness: { scope: :variant_id }
  end
end
