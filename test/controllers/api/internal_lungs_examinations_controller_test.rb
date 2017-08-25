require 'test_helper'

class Api::InternalLungsExaminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empty_autopsy = autopsies(:uncompleted_autopsy)
    @left_lung_params = {
      internal_lungs_examination: {
        deixis: 'left',
        weight: 190
      }
    }
    @right_lung_params = {
      internal_lungs_examination: {
        deixis: 'right',
        weight: 200
      }
    }
  end

  test 'should create a left lung' do
    assert_difference('InternalLungsExamination.left.count') do
      patch api_internal_lungs_examination_url(@empty_autopsy),
            params: @left_lung_params
    end
    assert_response :success
  end

  test 'should create a right lung' do
    assert_difference('InternalLungsExamination.right.count') do
      patch api_internal_lungs_examination_url(@empty_autopsy),
            params: @right_lung_params
    end
    assert_response :success
  end

  test 'should create a lung whose examination is attached to autopsy' do
    patch api_internal_lungs_examination_url(@empty_autopsy),
          params: @right_lung_params
    examination_id = JSON.parse(response.body)['model']['examination_id']
    examination = Examination.find(examination_id)
    assert_equal examination.autopsy.id, @empty_autopsy.id
  end

  test 'left/right lungs should have the same common examination' do
    patch api_internal_lungs_examination_url(@empty_autopsy),
          params: @left_lung_params
    left = JSON.parse(response.body)['model']
    patch api_internal_lungs_examination_url(@empty_autopsy),
          params: @right_lung_params
    right = JSON.parse(response.body)['model']
    assert_equal left['examination_id'], right['examination_id']
  end
end
