# frozen_string_literal: true

require_dependency "strails/application_controller"

module Strails
  class BackendController < ApplicationController
    include Croutons::Controller

    layout "strails/backend"
  end
end
