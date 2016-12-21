# == Schema Information
#
# Table name: internal_thoracic_aorta_examinations
#
#  id               :integer          not null, primary key
#  examination_id   :integer
#  width            :float
#  arteriosclerosis :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InternalThoracicAortaExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
