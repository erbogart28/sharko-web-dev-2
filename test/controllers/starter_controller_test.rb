require 'test_helper'

class StarterControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get starter_home_url
    assert_response :success
  end

end
