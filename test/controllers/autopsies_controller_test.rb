require 'test_helper'

class AutopsiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
  end

  test "should get index" do
    get autopsies_url
    assert_response :success
  end

  test "should get new" do
    get new_autopsy_url
    assert_response :success
  end

  test "should create autopsy" do
    assert_difference('Autopsy.count') do
      post autopsies_url, params: { autopsy: { autopsy_date: @autopsy.autopsy_date, completed: @autopsy.completed, court_id: @autopsy.court_id, ending_time: @autopsy.ending_time, judge_id: @autopsy.judge_id, number: @autopsy.number, place_id: @autopsy.place_id, police_inspector_id: @autopsy.police_inspector_id, police_station_id: @autopsy.police_station_id, starting_time: @autopsy.starting_time, suspect_id: @autopsy.suspect_id, victim_id: @autopsy.victim_id } }
    end

    assert_redirected_to autopsy_url(Autopsy.last)
  end

  test "should show autopsy" do
    get autopsy_url(@autopsy)
    assert_response :success
  end

  test "should get edit" do
    get edit_autopsy_url(@autopsy)
    assert_response :success
  end

  test "should update autopsy" do
    patch autopsy_url(@autopsy), params: { autopsy: { autopsy_date: @autopsy.autopsy_date, completed: @autopsy.completed, court_id: @autopsy.court_id, ending_time: @autopsy.ending_time, judge_id: @autopsy.judge_id, number: @autopsy.number, place_id: @autopsy.place_id, police_inspector_id: @autopsy.police_inspector_id, police_station_id: @autopsy.police_station_id, starting_time: @autopsy.starting_time, suspect_id: @autopsy.suspect_id, victim_id: @autopsy.victim_id } }
    assert_redirected_to autopsy_url(@autopsy)
  end

  test "should destroy autopsy" do
    assert_difference('Autopsy.count', -1) do
      delete autopsy_url(@autopsy)
    end

    assert_redirected_to autopsies_url
  end
end
