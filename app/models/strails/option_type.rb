# frozen_string_literal: true

module Strails
  class OptionType < ApplicationRecord
    validates :name, :presentation, presence: true

    def pretty_name
      "#{presentation} (#{name})"
    end
  end
end
