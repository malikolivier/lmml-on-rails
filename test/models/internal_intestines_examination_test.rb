# == Schema Information
#
# Table name: internal_intestines_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  appendix       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternalIntestinesExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
