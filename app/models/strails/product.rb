# frozen_string_literal: true

module Strails
  class Product < ApplicationRecord
    validates :name, presence: true
  end
end
