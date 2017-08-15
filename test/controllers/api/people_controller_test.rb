require 'test_helper'

class Api::PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_people_url
    assert_response :success
  end
end
