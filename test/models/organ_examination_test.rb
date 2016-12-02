# == Schema Information
#
# Table name: organ_examinations
#
#  id                  :integer          not null, primary key
#  organ_id            :integer
#  examination_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class OrganExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
