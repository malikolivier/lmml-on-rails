require 'test_helper'

class PhotographTest < ActiveSupport::TestCase
  test 'photograph url is a full url when photograph is here' do
    photograph = photographs(:face_autopsy_one)
    assert_match(%r{^/}, photograph.picture_url)
  end

  test 'photograph url is nil when no photograp is there' do
    assert_nil(Photograph.new.picture_url)
  end
end
