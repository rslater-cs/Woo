require "test_helper"

class AvailableRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_room = available_rooms(:one)
  end

  test "should get index" do
    get available_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_available_room_url
    assert_response :success
  end

  test "should create available_room" do
    assert_difference('AvailableRoom.count') do
      post available_rooms_url, params: { available_room: { clientIsFree: @available_room.clientIsFree, id: @available_room.id, tutorIsFree: @available_room.tutorIsFree } }
    end

    assert_redirected_to available_room_url(AvailableRoom.last)
  end

  test "should show available_room" do
    get available_room_url(@available_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_available_room_url(@available_room)
    assert_response :success
  end

  test "should update available_room" do
    patch available_room_url(@available_room), params: { available_room: { clientIsFree: @available_room.clientIsFree, id: @available_room.id, tutorIsFree: @available_room.tutorIsFree } }
    assert_redirected_to available_room_url(@available_room)
  end

  test "should destroy available_room" do
    assert_difference('AvailableRoom.count', -1) do
      delete available_room_url(@available_room)
    end

    assert_redirected_to available_rooms_url
  end
end
