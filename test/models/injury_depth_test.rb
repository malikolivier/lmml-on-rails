# == Schema Information
#
# Table name: injury_depths
#
#  id               :integer          not null, primary key
#  depth            :float
#  reached_organ_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InjuryDepthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
