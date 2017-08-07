require 'test_helper'

class Api::StockpricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_stockprices_index_url
    assert_response :success
  end

end
