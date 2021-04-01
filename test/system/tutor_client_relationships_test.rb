require "application_system_test_case"

class TutorClientRelationshipsTest < ApplicationSystemTestCase
  setup do
    @tutor_client_relationship = tutor_client_relationships(:one)
  end

  test "visiting the index" do
    visit tutor_client_relationships_url
    assert_selector "h1", text: "Tutor Client Relationships"
  end

  test "creating a Tutor client relationship" do
    visit tutor_client_relationships_url
    click_on "New Tutor Client Relationship"

    fill_in "Clientid", with: @tutor_client_relationship.clientID
    fill_in "Relid", with: @tutor_client_relationship.relID
    fill_in "Tutorid", with: @tutor_client_relationship.tutorID
    click_on "Create Tutor client relationship"

    assert_text "Tutor client relationship was successfully created"
    click_on "Back"
  end

  test "updating a Tutor client relationship" do
    visit tutor_client_relationships_url
    click_on "Edit", match: :first

    fill_in "Clientid", with: @tutor_client_relationship.clientID
    fill_in "Relid", with: @tutor_client_relationship.relID
    fill_in "Tutorid", with: @tutor_client_relationship.tutorID
    click_on "Update Tutor client relationship"

    assert_text "Tutor client relationship was successfully updated"
    click_on "Back"
  end

  test "destroying a Tutor client relationship" do
    visit tutor_client_relationships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tutor client relationship was successfully destroyed"
  end
end
