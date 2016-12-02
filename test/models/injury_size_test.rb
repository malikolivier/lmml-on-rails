# == Schema Information
#
# Table name: injury_sizes
#
#  id                     :integer          not null, primary key
#  shape                  :integer
#  length                 :float
#  width                  :float
#  in_body_orientation_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class InjurySizeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
