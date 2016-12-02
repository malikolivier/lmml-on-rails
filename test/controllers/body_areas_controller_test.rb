require 'test_helper'

class BodyAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_area = body_areas(:one)
  end

  test "should get index" do
    get body_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_body_area_url
    assert_response :success
  end

  test "should create body_area" do
    assert_difference('BodyArea.count') do
      post body_areas_url, params: { body_area: { distance: @body_area.distance } }
    end

    assert_redirected_to body_area_url(BodyArea.last)
  end

  test "should show body_area" do
    get body_area_url(@body_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_area_url(@body_area)
    assert_response :success
  end

  test "should update body_area" do
    patch body_area_url(@body_area), params: { body_area: { distance: @body_area.distance } }
    assert_redirected_to body_area_url(@body_area)
  end

  test "should destroy body_area" do
    assert_difference('BodyArea.count', -1) do
      delete body_area_url(@body_area)
    end

    assert_redirected_to body_areas_url
  end
end
