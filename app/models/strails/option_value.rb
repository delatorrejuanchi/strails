# frozen_string_literal: true

module Strails
  class OptionValue < ApplicationRecord
    belongs_to :option_type, class_name: "Strails::OptionType", inverse_of: :option_values
    has_many :option_value_variants,
             class_name: "Strails::OptionValueVariant",
             dependent: :destroy,
             inverse_of: :option_value
    has_many :variants, through: :option_value_variants, class_name: "Strails::Variant"

    validates :name, :presentation, :option_type, presence: true

    def pretty_name
      "#{presentation} (#{name})"
    end

    def pretty_full
      "#{option_type.pretty_name} -> #{pretty_name}"
    end
  end
end
