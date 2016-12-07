class InPleuraForeignFluid < ApplicationRecord
  belongs_to :internal_abdominal_wall_examination
  belongs_to :foreign_fluid
end
