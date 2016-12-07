# == Schema Information
#
# Table name: internal_pericardium_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  congestion     :integer
#  petechia       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternalPericardiumExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
