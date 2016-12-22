# == Schema Information
#
# Table name: internal_liver_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  hardness       :integer
#  congestion     :integer
#  steatosis      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternalLiverExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
