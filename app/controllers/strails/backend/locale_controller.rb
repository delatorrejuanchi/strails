# frozen_string_literal: true

require_dependency "strails/backend_controller"

module Strails
  module Backend
    class LocaleController < BackendController
      def change_locale
        cookies[:locale] = params[:locale]

        redirect_back(fallback_location: root_path)
      end
    end
  end
end
