# == Schema Information
#
# Table name: internal_kidneys_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  deixis             :integer          not null
#  weight             :float
#  hardness           :integer
#  capsule_removal    :integer
#  capsule_congestion :integer
#  pelvis_congestion  :integer
#  pelvis_petechia    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class InternalKidneysExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
