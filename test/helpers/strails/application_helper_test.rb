# frozen_string_literal: true

module Strails
  class ApplicationHelperTest < ActionView::TestCase
    test "#flash_messages" do
      flash[:notice] = "This is a notice"

      assert_dom_equal %(<div class="flash-messages"><div class="alert alert-info">This is a notice</div></div>),
                       flash_messages
    end

    test "#error_messages_for(record)" do
      valid_record = strails_products(:default)
      assert_nil error_messages_for(valid_record)

      invalid_record = Product.new

      assert invalid_record.invalid?
      assert_not_nil error_messages_for(invalid_record)
    end
  end
end
