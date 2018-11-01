# frozen_string_literal: true

require "test_helper"

module Strails
  class Test < ActiveSupport::TestCase
    test "truth" do
      assert_kind_of Module, Strails
    end
  end
end
