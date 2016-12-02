require 'test_helper'

class TestTriagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_triage = test_triages(:one)
  end

  test "should get index" do
    get test_triages_url
    assert_response :success
  end

  test "should get new" do
    get new_test_triage_url
    assert_response :success
  end

  test "should create test_triage" do
    assert_difference('TestTriage.count') do
      post test_triages_url, params: { test_triage: { note: @test_triage.note } }
    end

    assert_redirected_to test_triage_url(TestTriage.last)
  end

  test "should show test_triage" do
    get test_triage_url(@test_triage)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_triage_url(@test_triage)
    assert_response :success
  end

  test "should update test_triage" do
    patch test_triage_url(@test_triage), params: { test_triage: { note: @test_triage.note } }
    assert_redirected_to test_triage_url(@test_triage)
  end

  test "should destroy test_triage" do
    assert_difference('TestTriage.count', -1) do
      delete test_triage_url(@test_triage)
    end

    assert_redirected_to test_triages_url
  end
end
