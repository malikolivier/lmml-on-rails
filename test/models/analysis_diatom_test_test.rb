# == Schema Information
#
# Table name: analysis_diatom_tests
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  conclusion  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AnalysisDiatomTestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
