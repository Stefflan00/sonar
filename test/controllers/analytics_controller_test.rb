require 'test_helper'

class AnalyticsControllerTest < ActionController::TestCase
  test "should get visitors" do
    get :visitors
    assert_response :success
  end

end
