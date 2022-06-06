require "test_helper"

class Admin::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_endusers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_endusers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_endusers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_endusers_destroy_url
    assert_response :success
  end
end
