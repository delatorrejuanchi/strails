# frozen_string_literal: true

module Strails
  module ApplicationHelper
    include TranslationsHelper

    def flash_messages
      return if flash.empty?

      bootstrap_classes = { error: "danger", success: "sucess", alert: "warning", notice: "info" }
      fallback_class = "primary"

      content_tag(:div, class: "flash-messages") do
        capture do
          flash.each do |msg_type, text|
            alert_class = bootstrap_classes.fetch(msg_type.to_sym, fallback_class)
            concat(content_tag(:div, text, class: "alert alert-#{alert_class}"))
          end
        end
      end
    end

    def error_messages_for(record)
      return if record.errors.empty?

      error_count = record.errors.count
      model_name = record.class.name
      content_tag(:div, class: "error-list") do
        capture do
          concat(content_tag(:strong, t("errors.prohibited_from_being_saved_explanation",
                                        count: error_count,
                                        model_name: model_name)))
          concat(content_tag(:ul, error_list(record.errors)))
        end
      end
    end

    def material_icon(icon)
      content_tag :i, icon, class: "material-icons"
    end

    private

    def error_list(errors)
      capture do
        errors.full_messages.each do |message|
          concat(content_tag(:li, message))
        end
      end
    end
  end
end
