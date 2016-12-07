# == Schema Information
#
# Table name: internal_neck_organs_examinations
#
#  id                        :integer          not null, primary key
#  examination_id            :integer
#  lymph_level               :integer
#  oesophagus_substance_id   :integer
#  larynx_substance_id       :integer
#  trachea_substance_id      :integer
#  main_bronchi_substance_id :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class InternalNeckOrgansExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
