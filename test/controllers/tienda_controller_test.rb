require "test_helper"

class TiendaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tienda_index_url
    assert_response :success
  end
end
