# == Schema Information
#
# Table name: test_triage_drugs
#
#  id            :integer          not null, primary key
#  concentration :float
#  reaction      :integer
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class TestTriageDrugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
