require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User", email: "some@email.com",
                      password: "somePass", password_confirmation: "somePass")
  end

  test "should be valid" do
    assert @user.valid?  	
  end

  test "first name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "password should have minimum length of 6" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
