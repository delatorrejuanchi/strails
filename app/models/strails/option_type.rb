# frozen_string_literal: true

module Strails
  class OptionType < ApplicationRecord
    has_many :option_values, class_name: "Strails::OptionValue", dependent: :destroy, inverse_of: :option_type

    validates :name, :presentation, presence: true

    accepts_nested_attributes_for :option_values,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    def pretty_name
      "#{presentation} (#{name})"
    end
  end
end
