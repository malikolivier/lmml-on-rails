require 'test_helper'

class ExternalOutlineExaminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_outline_examination = external_outline_examinations(:one)
  end

  test "should get index" do
    get external_outline_examinations_url
    assert_response :success
  end

  test "should get new" do
    get new_external_outline_examination_url
    assert_response :success
  end

  test "should create external_outline_examination" do
    assert_difference('ExternalOutlineExamination.count') do
      post external_outline_examinations_url, params: { external_outline_examination: { constitution: @external_outline_examination.constitution, height: @external_outline_examination.height, partial_body: @external_outline_examination.partial_body, sex: @external_outline_examination.sex, weight: @external_outline_examination.weight } }
    end

    assert_redirected_to external_outline_examination_url(ExternalOutlineExamination.last)
  end

  test "should show external_outline_examination" do
    get external_outline_examination_url(@external_outline_examination)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_outline_examination_url(@external_outline_examination)
    assert_response :success
  end

  test "should update external_outline_examination" do
    patch external_outline_examination_url(@external_outline_examination), params: { external_outline_examination: { constitution: @external_outline_examination.constitution, height: @external_outline_examination.height, partial_body: @external_outline_examination.partial_body, sex: @external_outline_examination.sex, weight: @external_outline_examination.weight } }
    assert_redirected_to external_outline_examination_url(@external_outline_examination)
  end

  test "should destroy external_outline_examination" do
    assert_difference('ExternalOutlineExamination.count', -1) do
      delete external_outline_examination_url(@external_outline_examination)
    end

    assert_redirected_to external_outline_examinations_url
  end
end
