require 'test_helper'

class ApidocsControllerTest < ActionDispatch::IntegrationTest
  test 'get apidocs with success' do
    get api_docs_url
    assert_response :success
  end
end
