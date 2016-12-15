# == Schema Information
#
# Table name: internal_heart_examinations
#
#  id                          :integer          not null, primary key
#  examination_id              :integer
#  weight                      :float
#  rigor_mortis                :integer
#  epicardial_lipomatosis      :integer
#  epicardial_petechia         :integer
#  extracted_blood_quantity    :float
#  extracted_blood_color       :integer
#  extracted_blood_coagulation :integer
#  thickness_left              :float
#  thickness_right             :float
#  scar_left                   :integer
#  scar_right                  :integer
#  pulmonary_artery_width      :float
#  pulmonary_artery_thrombus   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class InternalHeartExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
