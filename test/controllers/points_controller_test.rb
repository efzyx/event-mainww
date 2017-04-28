require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get points_index_url
    assert_response :success
  end

  test "should get new" do
    get points_new_url
    assert_response :success
  end

  test "should get edit" do
    get points_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get points_destroy_url
    assert_response :success
  end

end
