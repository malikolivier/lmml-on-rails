require 'test_helper'

class Api::LmmlFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
  end

  test 'get LMML file' do
    get api_lmml_file_url(@autopsy)
    assert_response :success
  end
end
