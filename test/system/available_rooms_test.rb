require "application_system_test_case"

class AvailableRoomsTest < ApplicationSystemTestCase
  setup do
    @available_room = available_rooms(:one)
  end

  test "visiting the index" do
    visit available_rooms_url
    assert_selector "h1", text: "Available Rooms"
  end

  test "creating a Available room" do
    visit available_rooms_url
    click_on "New Available Room"

    check "Clientisfree" if @available_room.clientIsFree
    fill_in "Id", with: @available_room.id
    check "Tutorisfree" if @available_room.tutorIsFree
    click_on "Create Available room"

    assert_text "Available room was successfully created"
    click_on "Back"
  end

  test "updating a Available room" do
    visit available_rooms_url
    click_on "Edit", match: :first

    check "Clientisfree" if @available_room.clientIsFree
    fill_in "Id", with: @available_room.id
    check "Tutorisfree" if @available_room.tutorIsFree
    click_on "Update Available room"

    assert_text "Available room was successfully updated"
    click_on "Back"
  end

  test "destroying a Available room" do
    visit available_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Available room was successfully destroyed"
  end
end
