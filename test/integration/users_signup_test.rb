require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, users: {first_name: "",
  								 last_name: "",
  								 email: "invalid@email",
  								 password: "no",
  								 password_confirmation: "match"}
  		end
  		assert_template 'users/new'
  	end

end
