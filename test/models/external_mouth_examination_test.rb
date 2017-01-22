# == Schema Information
#
# Table name: external_mouth_examinations
#
#  id                           :integer          not null, primary key
#  closed                       :integer
#  aperture                     :float
#  petechia                     :integer
#  tongue_tip                   :integer
#  note                         :text
#  external_face_examination_id :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class ExternalMouthExaminationTest < ActiveSupport::TestCase
  test 'JSON set without error' do
    assert_equal(ExternalMouthExamination.json_includes, [])
  end
end
