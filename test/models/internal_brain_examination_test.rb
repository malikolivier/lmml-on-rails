# == Schema Information
#
# Table name: internal_brain_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  pia_congestion :integer
#  blood_spots    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternalBrainExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
