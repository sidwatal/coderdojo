require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get welcome_registration_page" do
    get :welcome_registration_page
    assert_response :success
  end

  test "should get user_registration_page" do
    get :user_registration_page
    assert_response :success
  end

  test "should get events_page" do
    get :events_page
    assert_response :success
  end

end
