# == Schema Information
#
# Table name: foreign_fluids
#
#  id          :integer          not null, primary key
#  color       :integer
#  name        :text
#  description :text
#  odor        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ForeignFluid < ApplicationRecord
  enum color: %i[no_color green white]
  enum odor: %i[no_odor putrid]

  # TODO: Delete me. I am deprecated and should be deleted as soon as all
  # views using foreign_fluids will be updated to use decorators.
  def self.explanation_of_array(foreign_fluids)
    ForeignFluidDecorator.decorate_collection(foreign_fluids).description
  end

  after_destroy :destroy_relationships

  private

  def destroy_relationships
    InMouthForeignFluid.where(foreign_fluid: self).destroy_all
    InLungForeignFluid.where(foreign_fluid: self).destroy_all
    InPeritoneumForeignFluid.where(foreign_fluid: self).destroy_all
    InPleuraForeignFluid.where(foreign_fluid: self).destroy_all
  end
end
