require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get toppage" do
    get home_toppage_url
    assert_response :success
  end

end
