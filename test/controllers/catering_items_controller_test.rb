require 'test_helper'

class CateringItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get CateringMenu" do
    get catering_items_CateringMenu_url
    assert_response :success
  end

end
