# == Schema Information
#
# Table name: instant_view_drug_results
#
#  id                       :integer          not null, primary key
#  analysis_instant_view_id :integer
#  drug_id                  :integer
#  result                   :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class InstantViewDrugResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
