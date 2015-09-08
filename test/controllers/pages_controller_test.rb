require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get afterschool" do
    get :afterschool
    assert_response :success
  end

end
