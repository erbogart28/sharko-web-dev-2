require 'test_helper'

class CaterOrderOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cater_order_option = cater_order_options(:one)
  end

  test "should get index" do
    get cater_order_options_url
    assert_response :success
  end

  test "should get new" do
    get new_cater_order_option_url
    assert_response :success
  end

  test "should create cater_order_option" do
    assert_difference('CaterOrderOption.count') do
      post cater_order_options_url, params: { cater_order_option: { CaterDesc: @cater_order_option.CaterDesc, cateringOptions: @cater_order_option.cateringOptions, price: @cater_order_option.price, sideDesc: @cater_order_option.sideDesc, sideOptions: @cater_order_option.sideOptions } }
    end

    assert_redirected_to cater_order_option_url(CaterOrderOption.last)
  end

  test "should show cater_order_option" do
    get cater_order_option_url(@cater_order_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_cater_order_option_url(@cater_order_option)
    assert_response :success
  end

  test "should update cater_order_option" do
    patch cater_order_option_url(@cater_order_option), params: { cater_order_option: { CaterDesc: @cater_order_option.CaterDesc, cateringOptions: @cater_order_option.cateringOptions, price: @cater_order_option.price, sideDesc: @cater_order_option.sideDesc, sideOptions: @cater_order_option.sideOptions } }
    assert_redirected_to cater_order_option_url(@cater_order_option)
  end

  test "should destroy cater_order_option" do
    assert_difference('CaterOrderOption.count', -1) do
      delete cater_order_option_url(@cater_order_option)
    end

    assert_redirected_to cater_order_options_url
  end
end
