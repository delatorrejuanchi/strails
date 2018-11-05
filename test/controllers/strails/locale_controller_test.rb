# frozen_string_literal: true

require "test_helper"

module Strails
  class LocaleControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should change locale cookie" do
      post change_locale_path, params: { locale: "es" }

      assert_equal "es", cookies[:locale]
    end
  end
end
