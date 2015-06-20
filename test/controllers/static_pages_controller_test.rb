require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home #tests home page 
    assert_response :success
    assert_select "title", "Marshall Twitter Home"
  end
  test "should get tim" do 
	get :tim
	assert_response :success
	assert_select "title", "Marshall Twitter Tim"
  end
  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Marshall Twitter Help"
  end

  test "should get about" do 
	get :about
	assert_response :success
	assert_select "title", "Marshall Twitter About"
  end

  #Tests for slightly dynamic static pages
  
end
