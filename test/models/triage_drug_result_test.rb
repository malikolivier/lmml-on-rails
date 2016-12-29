# == Schema Information
#
# Table name: triage_drug_results
#
#  id                 :integer          not null, primary key
#  analysis_triage_id :integer
#  drug_id            :integer
#  result             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class TriageDrugResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
