require "application_system_test_case"

class AdultsTest < ApplicationSystemTestCase
  setup do
    @adult = adults(:one)
  end

  test "visiting the index" do
    visit adults_url
    assert_selector "h1", text: "Adults"
  end

  test "creating a Adult" do
    visit adults_url
    click_on "New Adult"

    click_on "Create Adult"

    assert_text "Adult was successfully created"
    click_on "Back"
  end

  test "updating a Adult" do
    visit adults_url
    click_on "Edit", match: :first

    click_on "Update Adult"

    assert_text "Adult was successfully updated"
    click_on "Back"
  end

  test "destroying a Adult" do
    visit adults_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adult was successfully destroyed"
  end
end
