require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get "#{url_for(Person)}.json"
    assert_response :success
  end
end
