require 'test_helper'

class Api::AutopsiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
    @params = {
      autopsy: {
        autopsy_date: Time.zone.today
      }
    }
  end

  test 'should update autopsy' do
    patch api_autopsy_url(@autopsy), params: @params
    assert_response :success
  end
end
