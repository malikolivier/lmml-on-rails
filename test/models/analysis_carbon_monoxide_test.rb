# == Schema Information
#
# Table name: analysis_carbon_monoxides
#
#  id                     :integer          not null, primary key
#  analysis_id            :integer
#  left_heart_saturation  :float
#  right_heart_saturation :float
#  iliac_vein_saturation  :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class AnalysisCarbonMonoxideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
