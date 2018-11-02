# frozen_string_literal: true

module Strails
  class OptionValue < ApplicationRecord
    belongs_to :option_type

    validates :name, :presentation, :option_type, presence: true

    def pretty_name
      "#{presentation} (#{name})"
    end
  end
end
