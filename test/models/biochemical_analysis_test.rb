# == Schema Information
#
# Table name: biochemical_analyses
#
#  id                           :integer          not null, primary key
#  analysis_biochemistry_id     :integer
#  contract_institution_id      :integer
#  biochemical_analysis_type_id :integer
#  date                         :date
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class BiochemicalAnalysisTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
