# == Schema Information
#
# Table name: external_eye_examinations
#
#  id                           :integer          not null, primary key
#  external_face_examination_id :integer          not null
#  deixis                       :integer          not null
#  closed                       :integer
#  aperture                     :float
#  eyelid_congestion            :integer
#  eyelid_petechia              :integer
#  eyelid_note                  :text
#  conjunctiva_congestion       :integer
#  conjunctiva_petechia         :integer
#  conjunctiva_note             :text
#  cornea                       :text
#  pupil                        :text
#  diameter                     :float
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class ExternalEyeExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
