# == Schema Information
#
# Table name: biochemical_analysis_results
#
#  id                      :integer          not null, primary key
#  biochemical_analysis_id :integer
#  molecule_id             :integer
#  quantity                :float
#  approximate             :boolean          default(FALSE)
#  unit                    :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class BiochemicalAnalysisResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
