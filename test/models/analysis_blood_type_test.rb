# == Schema Information
#
# Table name: analysis_blood_types
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  anti_a      :integer
#  anti_b      :integer
#  anti_h      :integer
#  blood_type  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AnalysisBloodTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
