require 'test_helper'

class InjuriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
  end

  ExaminationType.all_names.each do |examination_name|
    test "Can index injuries in #{examination_name}" do
      get send("api_#{examination_name}_injuries_url", id: @autopsy.id,
                                                       format: :json)
      assert_response :success
    end
  end
end
