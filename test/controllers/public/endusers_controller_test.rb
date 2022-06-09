require "test_helper"

class Public::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_endusers_index_url
    assert_response :success
  end

  test "should get show" do
    get public_endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_endusers_edit_url
    assert_response :success
  end
end
