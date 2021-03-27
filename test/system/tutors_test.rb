require "application_system_test_case"

class TutorsTest < ApplicationSystemTestCase
  setup do
    @tutor = tutors(:one)
  end

  test "visiting the index" do
    visit tutors_url
    assert_selector "h1", text: "Tutors"
  end

  test "creating a Tutor" do
    visit tutors_url
    click_on "New Tutor"

    click_on "Create Tutor"

    assert_text "Tutor was successfully created"
    click_on "Back"
  end

  test "updating a Tutor" do
    visit tutors_url
    click_on "Edit", match: :first

    click_on "Update Tutor"

    assert_text "Tutor was successfully updated"
    click_on "Back"
  end

  test "destroying a Tutor" do
    visit tutors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tutor was successfully destroyed"
  end
end
