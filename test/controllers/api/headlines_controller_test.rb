require 'test_helper'

class Api::HeadlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_headlines_index_url
    assert_response :success
  end

end
