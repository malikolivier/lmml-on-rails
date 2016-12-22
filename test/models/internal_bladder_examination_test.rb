# == Schema Information
#
# Table name: internal_bladder_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  urine_color        :integer
#  urine_quantity     :float
#  urine_transparency :integer
#  membrane_color     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class InternalBladderExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
