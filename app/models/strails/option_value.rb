# frozen_string_literal: true

module Strails
  class OptionValue < ApplicationRecord
    belongs_to :option_type, inverse_of: :option_values
    has_many :option_value_variants, dependent: :destroy, inverse_of: :option_value
    has_many :variants, through: :option_value_variants

    validates :name, presence: true
    validates :option_type, presence: true
    validates :presentation, presence: true

    def pretty_name
      "#{presentation} (#{name})"
    end

    def pretty_full
      "#{option_type.pretty_name} -> #{pretty_name}"
    end
  end
end
