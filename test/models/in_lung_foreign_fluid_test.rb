# == Schema Information
#
# Table name: in_lung_foreign_fluids
#
#  id                            :integer          not null, primary key
#  internal_lungs_examination_id :integer          not null
#  foreign_fluid_id              :integer          not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class InLungForeignFluidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
