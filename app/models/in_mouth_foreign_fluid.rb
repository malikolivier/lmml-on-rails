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

class InMouthForeignFluid < ApplicationRecord
  belongs_to :external_mouth_examination, required: true
  belongs_to :foreign_fluid, required: true
end
