require "test_helper"

class TutorSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_subject = tutor_subjects(:one)
  end

  test "should get index" do
    get tutor_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_subject_url
    assert_response :success
  end

  test "should create tutor_subject" do
    assert_difference('TutorSubject.count') do
      post tutor_subjects_url, params: { tutor_subject: { subject: @tutor_subject.subject, subjectID: @tutor_subject.subjectID, tutorID: @tutor_subject.tutorID } }
    end

    assert_redirected_to tutor_subject_url(TutorSubject.last)
  end

  test "should show tutor_subject" do
    get tutor_subject_url(@tutor_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_subject_url(@tutor_subject)
    assert_response :success
  end

  test "should update tutor_subject" do
    patch tutor_subject_url(@tutor_subject), params: { tutor_subject: { subject: @tutor_subject.subject, subjectID: @tutor_subject.subjectID, tutorID: @tutor_subject.tutorID } }
    assert_redirected_to tutor_subject_url(@tutor_subject)
  end

  test "should destroy tutor_subject" do
    assert_difference('TutorSubject.count', -1) do
      delete tutor_subject_url(@tutor_subject)
    end

    assert_redirected_to tutor_subjects_url
  end
end
