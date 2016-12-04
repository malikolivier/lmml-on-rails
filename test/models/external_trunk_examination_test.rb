# == Schema Information
#
# Table name: external_trunk_examinations
#
#  id                      :integer          not null, primary key
#  examination_id          :integer
#  abnominal_discoloration :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class ExternalTrunkExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
