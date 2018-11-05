# frozen_string_literal: true

require_dependency "strails/application_controller"

module Strails
  class LocaleController < ApplicationController
    def change_locale
      cookies[:locale] = params[:locale]

      redirect_back(fallback_location: root_path)
    end
  end
end
