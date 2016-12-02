require 'test_helper'

class TestBloodTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_blood_type = test_blood_types(:one)
  end

  test "should get index" do
    get test_blood_types_url
    assert_response :success
  end

  test "should get new" do
    get new_test_blood_type_url
    assert_response :success
  end

  test "should create test_blood_type" do
    assert_difference('TestBloodType.count') do
      post test_blood_types_url, params: { test_blood_type: { note: @test_blood_type.note, result: @test_blood_type.result } }
    end

    assert_redirected_to test_blood_type_url(TestBloodType.last)
  end

  test "should show test_blood_type" do
    get test_blood_type_url(@test_blood_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_blood_type_url(@test_blood_type)
    assert_response :success
  end

  test "should update test_blood_type" do
    patch test_blood_type_url(@test_blood_type), params: { test_blood_type: { note: @test_blood_type.note, result: @test_blood_type.result } }
    assert_redirected_to test_blood_type_url(@test_blood_type)
  end

  test "should destroy test_blood_type" do
    assert_difference('TestBloodType.count', -1) do
      delete test_blood_type_url(@test_blood_type)
    end

    assert_redirected_to test_blood_types_url
  end
end
