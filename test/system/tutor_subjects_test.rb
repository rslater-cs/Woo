require "application_system_test_case"

class TutorSubjectsTest < ApplicationSystemTestCase
  setup do
    @tutor_subject = tutor_subjects(:one)
  end

  test "visiting the index" do
    visit tutor_subjects_url
    assert_selector "h1", text: "Tutor Subjects"
  end

  test "creating a Tutor subject" do
    visit tutor_subjects_url
    click_on "New Tutor Subject"

    fill_in "Subject", with: @tutor_subject.subject
    fill_in "Subjectid", with: @tutor_subject.subjectID
    fill_in "Tutorid", with: @tutor_subject.tutorID
    click_on "Create Tutor subject"

    assert_text "Tutor subject was successfully created"
    click_on "Back"
  end

  test "updating a Tutor subject" do
    visit tutor_subjects_url
    click_on "Edit", match: :first

    fill_in "Subject", with: @tutor_subject.subject
    fill_in "Subjectid", with: @tutor_subject.subjectID
    fill_in "Tutorid", with: @tutor_subject.tutorID
    click_on "Update Tutor subject"

    assert_text "Tutor subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Tutor subject" do
    visit tutor_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tutor subject was successfully destroyed"
  end
end
