require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'NAME', email: 'name@example.com',
      password: "secret", password_confirmation: "secret"
    )
  end

  test "is valid" do
    assert @user.valid?
  end

  test "is not valid" do
    user = User.new
    assert_not user.valid?
  end

  test "is not valid without password" do
    @user.password = @user.password_confirmation = nil
    assert_not @user.valid?
  end

  test "is not valid when password is unconfirmed" do
    @user.password_confirmation = "wrong"
    assert_not @user.valid?
  end

  test "is not valid when password is too short" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "name is not too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email is not too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation accepts valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} is valid"
    end
  end

  test "email validation reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} is invalid"
    end
  end

  test "email addresses are unique" do
    another_user = @user.dup
    @user.save
    assert_not another_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "authenticated? returns false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
