require 'test_helper'

class PhotographsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photograph = photographs(:one)
  end

  test "should get index" do
    get photographs_url
    assert_response :success
  end

  test "should get new" do
    get new_photograph_url
    assert_response :success
  end

  test "should create photograph" do
    assert_difference('Photograph.count') do
      post photographs_url, params: { photograph: { caption: @photograph.caption, type: @photograph.type } }
    end

    assert_redirected_to photograph_url(Photograph.last)
  end

  test "should show photograph" do
    get photograph_url(@photograph)
    assert_response :success
  end

  test "should get edit" do
    get edit_photograph_url(@photograph)
    assert_response :success
  end

  test "should update photograph" do
    patch photograph_url(@photograph), params: { photograph: { caption: @photograph.caption, type: @photograph.type } }
    assert_redirected_to photograph_url(@photograph)
  end

  test "should destroy photograph" do
    assert_difference('Photograph.count', -1) do
      delete photograph_url(@photograph)
    end

    assert_redirected_to photographs_url
  end
end
