# frozen_string_literal: true

require_dependency "strails/application_controller"

module Strails
  class FrontendController < ApplicationController
    layout "strails/frontend"
  end
end
