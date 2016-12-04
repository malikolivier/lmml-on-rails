# == Schema Information
#
# Table name: in_mouth_foreign_fluids
#
#  id                            :integer          not null, primary key
#  external_mouth_examination_id :integer
#  foreign_fluid_id              :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class InMouthForeignFluidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
