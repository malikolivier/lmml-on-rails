require 'test_helper'

class AutopsiesFilterTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
  end

  test 'get all autopsies' do
    get api_autopsies_url(format: :json)
    assert_equal Autopsy.count, JSON.parse(@response.body).length
  end

  test 'only get autopsy by number' do
    get api_autopsies_url(number: @autopsy.number, format: :json)
    assert_equal @autopsy.number, JSON.parse(@response.body)[0]['number']
  end

  test 'only get autopsy by examiner_id' do
    get api_autopsies_url(examiner_id: @autopsy.examiner_id, format: :json)
    assert_equal @autopsy.examiner_id,
                 JSON.parse(@response.body)[0]['examiner_id']
  end

  test 'only get autopsy by police_inspector_id' do
    get api_autopsies_url(police_inspector_id: @autopsy.police_inspector_id,
                          format: :json)
    assert_equal @autopsy.police_inspector_id,
                 JSON.parse(@response.body)[0]['police_inspector_id']
  end
end
