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
  enum color: [:no_color, :green]
  enum odor: [:no_odor]
end
