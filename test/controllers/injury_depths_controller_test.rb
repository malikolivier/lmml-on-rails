require 'test_helper'

class InjuryDepthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @injury_depth = injury_depths(:one)
  end

  test "should get index" do
    get injury_depths_url
    assert_response :success
  end

  test "should get new" do
    get new_injury_depth_url
    assert_response :success
  end

  test "should create injury_depth" do
    assert_difference('InjuryDepth.count') do
      post injury_depths_url, params: { injury_depth: { depth: @injury_depth.depth } }
    end

    assert_redirected_to injury_depth_url(InjuryDepth.last)
  end

  test "should show injury_depth" do
    get injury_depth_url(@injury_depth)
    assert_response :success
  end

  test "should get edit" do
    get edit_injury_depth_url(@injury_depth)
    assert_response :success
  end

  test "should update injury_depth" do
    patch injury_depth_url(@injury_depth), params: { injury_depth: { depth: @injury_depth.depth } }
    assert_redirected_to injury_depth_url(@injury_depth)
  end

  test "should destroy injury_depth" do
    assert_difference('InjuryDepth.count', -1) do
      delete injury_depth_url(@injury_depth)
    end

    assert_redirected_to injury_depths_url
  end
end
