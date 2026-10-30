require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup { @user = users(:one) }

  test "downcases and strips email_address" do
    new_user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", new_user.email_address)
  end

  test "#full_name returns first and last name" do
    assert_includes @user.full_name, @user.first_name
    assert_includes @user.full_name, @user.last_name
  end
end
