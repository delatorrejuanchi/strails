# frozen_string_literal: true

module Strails
  class ApplicationHelperTest < ActionView::TestCase
    test "should display flash_messages" do
      flash[:notice] = "This is a notice"

      assert_dom_equal %(<div class="flash-messages"><div class="alert alert-info">This is a notice</div></div>),
                       flash_messages
    end

    test "should display error_messages_for a record" do
      record = Product.new
      record.valid?

      assert error_messages_for(record).include? "1 error prohibited this Strails::Product from being saved:"
    end
  end
end
