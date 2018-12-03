require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "get root" do
    get root_url
    assert_response :success
  end
end
