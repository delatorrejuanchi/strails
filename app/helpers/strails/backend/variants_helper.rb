# frozen_string_literal: true

require "byebug"

module Strails
  module Backend
    module VariantsHelper
      def display_variant_extra_price(variant)
        extra_price = variant.extra_price
        return if extra_price.zero?

        content_tag(:span, class: extra_price.positive? ? "text-success" : "text-danger") do
          "#{'+' if extra_price.positive?}#{number_to_currency(extra_price)}"
        end
      end
    end
  end
end
