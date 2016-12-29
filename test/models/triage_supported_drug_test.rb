# == Schema Information
#
# Table name: triage_supported_drugs
#
#  id                      :integer          not null, primary key
#  drug_id                 :integer
#  concentration_threshold :float
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class TriageSupportedDrugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
