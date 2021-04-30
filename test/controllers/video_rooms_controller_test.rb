require "test_helper"

class VideoRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video_room = video_rooms(:one)
  end

  test "should get index" do
    get video_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_video_room_url
    assert_response :success
  end

  test "should create video_room" do
    assert_difference('VideoRoom.count') do
      post video_rooms_url, params: { video_room: { isFree: @video_room.isFree, tutorIsFree: @video_room.tutorIsFree, url: @video_room.url } }
    end

    assert_redirected_to video_room_url(VideoRoom.last)
  end

  test "should show video_room" do
    get video_room_url(@video_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_room_url(@video_room)
    assert_response :success
  end

  test "should update video_room" do
    patch video_room_url(@video_room), params: { video_room: { isFree: @video_room.isFree, tutorIsFree: @video_room.tutorIsFree, url: @video_room.url } }
    assert_redirected_to video_room_url(@video_room)
  end

  test "should destroy video_room" do
    assert_difference('VideoRoom.count', -1) do
      delete video_room_url(@video_room)
    end

    assert_redirected_to video_rooms_url
  end
end
