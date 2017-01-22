# == Schema Information
#
# Table name: external_face_examinations
#
#  id                   :integer          not null, primary key
#  examination_id       :integer
#  congestion           :integer
#  swelling             :integer
#  nasal_cavity_content :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class ExternalFaceExaminationTest < ActiveSupport::TestCase
  test 'JSON set without error' do
    assert_equal(ExternalFaceExamination.json_includes,
                 external_eye_examinations: {},
                 external_mouth_examination: {
                   include: :tooth_examinations
                 })
  end
end
