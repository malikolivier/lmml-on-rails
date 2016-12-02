require 'test_helper'

class InjurySizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @injury_size = injury_sizes(:one)
  end

  test "should get index" do
    get injury_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_injury_size_url
    assert_response :success
  end

  test "should create injury_size" do
    assert_difference('InjurySize.count') do
      post injury_sizes_url, params: { injury_size: { length: @injury_size.length, shape: @injury_size.shape, width: @injury_size.width } }
    end

    assert_redirected_to injury_size_url(InjurySize.last)
  end

  test "should show injury_size" do
    get injury_size_url(@injury_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_injury_size_url(@injury_size)
    assert_response :success
  end

  test "should update injury_size" do
    patch injury_size_url(@injury_size), params: { injury_size: { length: @injury_size.length, shape: @injury_size.shape, width: @injury_size.width } }
    assert_redirected_to injury_size_url(@injury_size)
  end

  test "should destroy injury_size" do
    assert_difference('InjurySize.count', -1) do
      delete injury_size_url(@injury_size)
    end

    assert_redirected_to injury_sizes_url
  end
end
