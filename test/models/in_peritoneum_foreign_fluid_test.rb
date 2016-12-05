# == Schema Information
#
# Table name: in_peritoneum_foreign_fluids
#
#  id                                     :integer          not null, primary key
#  internal_abdominal_wall_examination_id :integer          not null
#  foreign_fluid_id                       :integer          not null
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#

require 'test_helper'

class InPeritoneumForeignFluidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
