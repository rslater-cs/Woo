require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about_us" do
    get pages_about_us_url
    assert_response :success
  end

  #test "should get contact" do
    #get pages_contact_url
    #assert_response :success
  #end

  test "should get contact" do
    get pages_contact_url
    assert_response :success

    assert_template layout: 'application'
    assert_select 'title', 'Woo'
    assert_select 'h1', 'Contact Us'
    assert_select'p', 'Complete the following form to get in touch with us.'
  end

end
