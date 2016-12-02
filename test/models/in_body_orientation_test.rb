# == Schema Information
#
# Table name: in_body_orientations
#
#  id                :integer          not null, primary key
#  coordinate_system :integer          not null
#  x                 :float
#  y                 :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class InBodyOrientationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
