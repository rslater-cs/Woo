require "application_system_test_case"

class AccessesTest < ApplicationSystemTestCase
  setup do
    @access = accesses(:one)
  end

  test "visiting the index" do
    visit accesses_url
    assert_selector "h1", text: "Accesses"
  end

  test "creating a Access" do
    visit accesses_url
    click_on "New Access"

    fill_in "Relid", with: @access.relID
    fill_in "Videolink", with: @access.videolink
    click_on "Create Access"

    assert_text "Access was successfully created"
    click_on "Back"
  end

  test "updating a Access" do
    visit accesses_url
    click_on "Edit", match: :first

    fill_in "Relid", with: @access.relID
    fill_in "Videolink", with: @access.videolink
    click_on "Update Access"

    assert_text "Access was successfully updated"
    click_on "Back"
  end

  test "destroying a Access" do
    visit accesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Access was successfully destroyed"
  end
end
