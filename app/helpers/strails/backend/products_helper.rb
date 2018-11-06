# frozen_string_literal: true

module Strails
  module Backend
    module ProductsHelper
      def option_type_checkbox(form, option_type)
        id = option_type.id
        checkbox_id = "option-type-#{id}-checkbox"
        onclick = "checkOptionValues(#{id})"

        checkbox = form.check_box("option_type_#{id}",
                                  { class: "form-check-input", id: checkbox_id, onclick: onclick },
                                  id,
                                  nil)
        label = form.label(checkbox_id,
                           content_tag(:strong, option_type.pretty_name),
                           class: "form-check-label")
        checkbox + label
      end

      def option_value_checkboxes(form, option_values)
        option_type_id = option_values.first.option_type.id
        list_id = "option-values-for-option-type-#{option_type_id}"

        content_tag(:ul, class: "list-unstyled mb-3 pl-3", id: list_id) do
          capture do
            option_values.each do |option_value|
              concat(content_tag(:li, option_value_checkbox(form, option_value)))
            end
          end
        end
      end

      def option_value_checkbox(form, option_value)
        id = option_value.id
        checkbox_id = "option-value-#{id}-checkbox"
        onclick = "checkOptionType(#{option_value.option_type.id})"

        checkbox = form.check_box(:option_value_ids,
                                  { multiple: true, class: "form-check-input", id: checkbox_id, onclick: onclick },
                                  id,
                                  nil)
        label = form.label(checkbox_id,
                           option_value.pretty_name,
                           class: "form-check-label")
        checkbox + label
      end
    end
  end
end
