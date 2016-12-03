# == Schema Information
#
# Table name: injury_photograph_takings
#
#  id            :integer          not null, primary key
#  injury_id     :integer
#  photograph_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class InjuryPhotographTakingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
