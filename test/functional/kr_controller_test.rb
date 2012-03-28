require 'test_helper'

class KrControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get success" do
    get :success
    assert_response :success
  end

end
