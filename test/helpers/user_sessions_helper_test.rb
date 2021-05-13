require "test_helper"

class UserSessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:peter)
    remember_user(@user)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert signed_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
    assert_not signed_in?
  end
end
