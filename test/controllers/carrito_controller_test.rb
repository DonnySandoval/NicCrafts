require "test_helper"

class CarritoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carrito_index_url
    assert_response :success
  end
end
