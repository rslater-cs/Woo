require "test_helper"

class AdultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adult = adults(:one)
  end

  test "should get index" do
    get adults_url
    assert_response :success
  end

  test "should get new" do
    get new_adult_url
    assert_response :success
  end

  test "should create adult" do
    assert_difference('Adult.count') do
      post adults_url, params: { adult: {  } }
    end

    assert_redirected_to adult_url(Adult.last)
  end

  test "should show adult" do
    get adult_url(@adult)
    assert_response :success
  end

  test "should get edit" do
    get edit_adult_url(@adult)
    assert_response :success
  end

  test "should update adult" do
    patch adult_url(@adult), params: { adult: {  } }
    assert_redirected_to adult_url(@adult)
  end

  test "should destroy adult" do
    assert_difference('Adult.count', -1) do
      delete adult_url(@adult)
    end

    assert_redirected_to adults_url
  end
end
