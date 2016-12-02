require 'test_helper'

class TestBloodTypeExperimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_blood_type_experiment = test_blood_type_experiments(:one)
  end

  test "should get index" do
    get test_blood_type_experiments_url
    assert_response :success
  end

  test "should get new" do
    get new_test_blood_type_experiment_url
    assert_response :success
  end

  test "should create test_blood_type_experiment" do
    assert_difference('TestBloodTypeExperiment.count') do
      post test_blood_type_experiments_url, params: { test_blood_type_experiment: { reaction: @test_blood_type_experiment.reaction, serum: @test_blood_type_experiment.serum } }
    end

    assert_redirected_to test_blood_type_experiment_url(TestBloodTypeExperiment.last)
  end

  test "should show test_blood_type_experiment" do
    get test_blood_type_experiment_url(@test_blood_type_experiment)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_blood_type_experiment_url(@test_blood_type_experiment)
    assert_response :success
  end

  test "should update test_blood_type_experiment" do
    patch test_blood_type_experiment_url(@test_blood_type_experiment), params: { test_blood_type_experiment: { reaction: @test_blood_type_experiment.reaction, serum: @test_blood_type_experiment.serum } }
    assert_redirected_to test_blood_type_experiment_url(@test_blood_type_experiment)
  end

  test "should destroy test_blood_type_experiment" do
    assert_difference('TestBloodTypeExperiment.count', -1) do
      delete test_blood_type_experiment_url(@test_blood_type_experiment)
    end

    assert_redirected_to test_blood_type_experiments_url
  end
end
