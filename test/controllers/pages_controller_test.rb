require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get startpage" do
    get :startpage
    assert_response :success
  end

end
