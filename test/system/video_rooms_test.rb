require "application_system_test_case"

class VideoRoomsTest < ApplicationSystemTestCase
  setup do
    @video_room = video_rooms(:one)
  end

  test "visiting the index" do
    visit video_rooms_url
    assert_selector "h1", text: "Video Rooms"
  end

  test "creating a Video room" do
    visit video_rooms_url
    click_on "New Video Room"

    check "Isfree" if @video_room.isFree
    check "Tutorisfree" if @video_room.tutorIsFree
    fill_in "Url", with: @video_room.url
    click_on "Create Video room"

    assert_text "Video room was successfully created"
    click_on "Back"
  end

  test "updating a Video room" do
    visit video_rooms_url
    click_on "Edit", match: :first

    check "Isfree" if @video_room.isFree
    check "Tutorisfree" if @video_room.tutorIsFree
    fill_in "Url", with: @video_room.url
    click_on "Update Video room"

    assert_text "Video room was successfully updated"
    click_on "Back"
  end

  test "destroying a Video room" do
    visit video_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video room was successfully destroyed"
  end
end
