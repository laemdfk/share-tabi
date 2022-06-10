require "test_helper"

class Public::PostimagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_postimages_new_url
    assert_response :success
  end

  test "should get create" do
    get public_postimages_create_url
    assert_response :success
  end

  test "should get show" do
    get public_postimages_show_url
    assert_response :success
  end

  test "should get index" do
    get public_postimages_index_url
    assert_response :success
  end
end
