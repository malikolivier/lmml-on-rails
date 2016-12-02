# == Schema Information
#
# Table name: body_areas
#
#  id                     :integer          not null, primary key
#  body_reference_id      :integer          not null
#  in_body_orientation_id :integer
#  distance               :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class BodyAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
