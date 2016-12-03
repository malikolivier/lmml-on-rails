require 'test_helper'

class ExternalHeadExaminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_head_examination = external_head_examinations(:one)
  end

  test "should get index" do
    get external_head_examinations_url
    assert_response :success
  end

  test "should get new" do
    get new_external_head_examination_url
    assert_response :success
  end

  test "should create external_head_examination" do
    assert_difference('ExternalHeadExamination.count') do
      post external_head_examinations_url, params: { external_head_examination: { hair_dyed_color: @external_head_examination.hair_dyed_color, hair_natural_color: @external_head_examination.hair_natural_color, side_hair_length: @external_head_examination.side_hair_length, top_hair_length: @external_head_examination.top_hair_length } }
    end

    assert_redirected_to external_head_examination_url(ExternalHeadExamination.last)
  end

  test "should show external_head_examination" do
    get external_head_examination_url(@external_head_examination)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_head_examination_url(@external_head_examination)
    assert_response :success
  end

  test "should update external_head_examination" do
    patch external_head_examination_url(@external_head_examination), params: { external_head_examination: { hair_dyed_color: @external_head_examination.hair_dyed_color, hair_natural_color: @external_head_examination.hair_natural_color, side_hair_length: @external_head_examination.side_hair_length, top_hair_length: @external_head_examination.top_hair_length } }
    assert_redirected_to external_head_examination_url(@external_head_examination)
  end

  test "should destroy external_head_examination" do
    assert_difference('ExternalHeadExamination.count', -1) do
      delete external_head_examination_url(@external_head_examination)
    end

    assert_redirected_to external_head_examinations_url
  end
end
