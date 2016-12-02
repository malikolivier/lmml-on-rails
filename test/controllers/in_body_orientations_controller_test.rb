require 'test_helper'

class InBodyOrientationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @in_body_orientation = in_body_orientations(:one)
  end

  test "should get index" do
    get in_body_orientations_url
    assert_response :success
  end

  test "should get new" do
    get new_in_body_orientation_url
    assert_response :success
  end

  test "should create in_body_orientation" do
    assert_difference('InBodyOrientation.count') do
      post in_body_orientations_url, params: { in_body_orientation: { coordinate_system: @in_body_orientation.coordinate_system, x: @in_body_orientation.x, y: @in_body_orientation.y } }
    end

    assert_redirected_to in_body_orientation_url(InBodyOrientation.last)
  end

  test "should show in_body_orientation" do
    get in_body_orientation_url(@in_body_orientation)
    assert_response :success
  end

  test "should get edit" do
    get edit_in_body_orientation_url(@in_body_orientation)
    assert_response :success
  end

  test "should update in_body_orientation" do
    patch in_body_orientation_url(@in_body_orientation), params: { in_body_orientation: { coordinate_system: @in_body_orientation.coordinate_system, x: @in_body_orientation.x, y: @in_body_orientation.y } }
    assert_redirected_to in_body_orientation_url(@in_body_orientation)
  end

  test "should destroy in_body_orientation" do
    assert_difference('InBodyOrientation.count', -1) do
      delete in_body_orientation_url(@in_body_orientation)
    end

    assert_redirected_to in_body_orientations_url
  end
end
