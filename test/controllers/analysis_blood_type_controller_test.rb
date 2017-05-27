require 'test_helper'

class AnalysisBloodTypeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empty_autopsy = autopsies(:uncompleted_autopsy)
  end

  test 'should create a blood type analysis' do
    assert_difference('AnalysisBloodType.count') do
      post analysis_blood_type_url(@empty_autopsy)
    end
    assert_response :success
  end
end
