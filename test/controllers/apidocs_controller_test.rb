require 'test_helper'

class ApidocsControllerTest < ActionDispatch::IntegrationTest
  test 'get apidocs with success' do
    get apidocs_url
    assert_response :success
  end
end
