require 'test_helper'

class CateringItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get CateringMenu" do
    get catering_items_CateringMenu_url
    assert_response :success
  end

end

#test "can't delete product in cart" do
#  assert_difference('Product.count', 0) do
#  delete product_url(products(:two))
#  end

#  assert_redirected_to catering_items_CateringMenu_url
#  end

#test "should destroy catering option" do 
#  assert_difference('CaterOrderOption.count', -1) do 
#  delete catering_items_CateringMenu_url(@cater_order_options) 
#  end 
  
#  assert_redirected_to catering_items_CateringMenu_url
#  end