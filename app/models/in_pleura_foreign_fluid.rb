# == Schema Information
#
# Table name: in_pleura_foreign_fluids
#
#  id                                     :integer          not null, primary key
#  internal_abdominal_wall_examination_id :integer          not null
#  foreign_fluid_id                       :integer          not null
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#

class InPleuraForeignFluid < ApplicationRecord
  belongs_to :internal_abdominal_wall_examination
  belongs_to :foreign_fluid
end
