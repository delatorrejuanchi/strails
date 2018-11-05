# frozen_string_literal: true

module Strails
  module TranslationsHelper
    def translated_model_name(model, plural: false)
      "Strails::#{model.classify}".constantize.model_name.human(count: plural ? 2 : 1)
    end

    def translated_model_attribute(model, attribute)
      "Strails::#{model.classify}".constantize.human_attribute_name attribute
    end
  end
end
