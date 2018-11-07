# frozen_string_literal: true

module Strails
  class OptionValueVariant < ApplicationRecord
    belongs_to :option_value, inverse_of: :option_value_variants
    belongs_to :variant, inverse_of: :option_value_variants

    validates :option_value, presence: true
    validates :variant, presence: true
  end
end
