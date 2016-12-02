require 'test_helper'

class TestHistopathologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_histopathology = test_histopathologies(:one)
  end

  test "should get index" do
    get test_histopathologies_url
    assert_response :success
  end

  test "should get new" do
    get new_test_histopathology_url
    assert_response :success
  end

  test "should create test_histopathology" do
    assert_difference('TestHistopathology.count') do
      post test_histopathologies_url, params: { test_histopathology: { note: @test_histopathology.note } }
    end

    assert_redirected_to test_histopathology_url(TestHistopathology.last)
  end

  test "should show test_histopathology" do
    get test_histopathology_url(@test_histopathology)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_histopathology_url(@test_histopathology)
    assert_response :success
  end

  test "should update test_histopathology" do
    patch test_histopathology_url(@test_histopathology), params: { test_histopathology: { note: @test_histopathology.note } }
    assert_redirected_to test_histopathology_url(@test_histopathology)
  end

  test "should destroy test_histopathology" do
    assert_difference('TestHistopathology.count', -1) do
      delete test_histopathology_url(@test_histopathology)
    end

    assert_redirected_to test_histopathologies_url
  end
end
