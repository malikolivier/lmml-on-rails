# == Schema Information
#
# Table name: photographs
#
#  id                   :integer          not null, primary key
#  caption              :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

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
