require "test_helper"

class TutorClientRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_client_relationship = tutor_client_relationships(:one)
  end

  test "should get index" do
    get tutor_client_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_client_relationship_url
    assert_response :success
  end

  test "should create tutor_client_relationship" do
    assert_difference('TutorClientRelationship.count') do
      post tutor_client_relationships_url, params: { tutor_client_relationship: { clientID: @tutor_client_relationship.clientID, relID: @tutor_client_relationship.relID, tutorID: @tutor_client_relationship.tutorID } }
    end

    assert_redirected_to tutor_client_relationship_url(TutorClientRelationship.last)
  end

  test "should show tutor_client_relationship" do
    get tutor_client_relationship_url(@tutor_client_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_client_relationship_url(@tutor_client_relationship)
    assert_response :success
  end

  test "should update tutor_client_relationship" do
    patch tutor_client_relationship_url(@tutor_client_relationship), params: { tutor_client_relationship: { clientID: @tutor_client_relationship.clientID, relID: @tutor_client_relationship.relID, tutorID: @tutor_client_relationship.tutorID } }
    assert_redirected_to tutor_client_relationship_url(@tutor_client_relationship)
  end

  test "should destroy tutor_client_relationship" do
    assert_difference('TutorClientRelationship.count', -1) do
      delete tutor_client_relationship_url(@tutor_client_relationship)
    end

    assert_redirected_to tutor_client_relationships_url
  end
end
