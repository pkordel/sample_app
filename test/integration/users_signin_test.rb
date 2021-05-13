require "test_helper"

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:peter)
    get signin_path
    assert_template "user_sessions/new"
  end

  test "signin with valid credentials" do
    post signin_path, params: {
      session: { email: @user.email, password: "secret" }
    }
    assert signed_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert flash.empty?
    assert_select "a[href=?]", signin_path, count: 0
    assert_select "a[href=?]", signout_path
    assert_select "a[href=?]", user_path(@user)
    delete signout_path
    assert_not signed_in?
    assert_redirected_to root_url
    delete signout_path
    follow_redirect!
    assert_select "a[href=?]", signin_path
    assert_select "a[href=?]", signout_path,     count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "signin with invalid credentials" do
    post signin_path, params: { session: { email: "", password: "" } }
    assert_not signed_in?
    assert_template "user_sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "sign in with remembering" do
    sign_in_as(@user, remember_me: '1')
    assert_equal cookies[:remember_token], assigns(:user).remember_token
  end

  test "sign in without remembering" do
    # Sign in to store the cookie
    sign_in_as(@user, remember_me: '1')
    # Sign in again and verify the cookie is deleted
    sign_in_as(@user, remember_me: '0')
    assert cookies[:remember_token].blank?
  end
end
