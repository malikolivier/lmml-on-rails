# == Schema Information
#
# Table name: diatom_counts
#
#  id                      :integer          not null, primary key
#  analysis_diatom_test_id :integer
#  category                :integer
#  quantity                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class DiatomCountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
