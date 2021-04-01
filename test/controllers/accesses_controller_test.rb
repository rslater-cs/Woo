require "test_helper"

class AccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @access = accesses(:one)
  end

  test "should get index" do
    get accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_access_url
    assert_response :success
  end

  test "should create access" do
    assert_difference('Access.count') do
      post accesses_url, params: { access: { relID: @access.relID, videolink: @access.videolink } }
    end

    assert_redirected_to access_url(Access.last)
  end

  test "should show access" do
    get access_url(@access)
    assert_response :success
  end

  test "should get edit" do
    get edit_access_url(@access)
    assert_response :success
  end

  test "should update access" do
    patch access_url(@access), params: { access: { relID: @access.relID, videolink: @access.videolink } }
    assert_redirected_to access_url(@access)
  end

  test "should destroy access" do
    assert_difference('Access.count', -1) do
      delete access_url(@access)
    end

    assert_redirected_to accesses_url
  end
end
