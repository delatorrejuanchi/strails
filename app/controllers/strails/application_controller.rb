# frozen_string_literal: true

module Strails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale

    def set_locale
      if cookies[:locale].present? && I18n.available_locales.include?(cookies[:locale])
        I18n.locale = cookies[:locale]
      else
        I18n.locale = I18n.default_locale
        cookies[:locale] = I18n.locale
      end
    end
  end
end
