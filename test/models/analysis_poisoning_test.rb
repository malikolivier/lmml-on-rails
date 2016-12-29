# == Schema Information
#
# Table name: analysis_poisonings
#
#  id                      :integer          not null, primary key
#  analysis_id             :integer
#  contract_institution_id :integer
#  date                    :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class AnalysisPoisoningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
