# == Schema Information
#
# Table name: found_poisons
#
#  id                          :integer          not null, primary key
#  analysis_poisoning_id       :integer
#  drug_id                     :integer
#  chemical_analysis_method_id :integer
#  unit                        :integer
#  quantitative_concentration  :float
#  qualitative_concentration   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class FoundPoisonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
