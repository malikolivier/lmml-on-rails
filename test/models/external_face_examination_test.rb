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
  # test "the truth" do
  #   assert true
  # end
end
