require 'test_helper'

class ExplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @explication = explications(:one)
  end

  test "should get index" do
    get explications_url
    assert_response :success
  end

  test "should get new" do
    get new_explication_url
    assert_response :success
  end

  test "should create explication" do
    assert_difference('Explication.count') do
      post explications_url, params: { explication: { content: @explication.content, title: @explication.title } }
    end

    assert_redirected_to explication_url(Explication.last)
  end

  test "should show explication" do
    get explication_url(@explication)
    assert_response :success
  end

  test "should get edit" do
    get edit_explication_url(@explication)
    assert_response :success
  end

  test "should update explication" do
    patch explication_url(@explication), params: { explication: { content: @explication.content, title: @explication.title } }
    assert_redirected_to explication_url(@explication)
  end

  test "should destroy explication" do
    assert_difference('Explication.count', -1) do
      delete explication_url(@explication)
    end

    assert_redirected_to explications_url
  end
end
