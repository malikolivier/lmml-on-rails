require 'test_helper'

class AutopsyPhotographTakingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy = autopsies(:completed_autopsy)
    @photo_taking = autopsy_photograph_takings(:completed_autopsy_photo_face)
    picture = fixture_file_upload('files/test_front_photo.jpg', 'image/jpg')
    @params = {
      autopsy_photograph_taking: {
        category: 'front',
        photograph_attributes: {
          caption: 'Test caption (front)',
          picture: picture
        }
      }
    }
  end

  test 'create new photo' do
    assert_difference -> { @autopsy.photographs.count } do
      post autopsy_autopsy_photograph_takings_path(@autopsy), params: @params
    end
    assert_response :success
  end

  test 'delete photo' do
    assert_difference('AutopsyPhotographTaking.count', -1) do
      delete autopsy_photograph_taking_path(@photo_taking)
    end
    assert_response :success
  end
end
