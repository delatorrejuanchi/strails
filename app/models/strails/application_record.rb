# frozen_string_literal: true

module Strails
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
