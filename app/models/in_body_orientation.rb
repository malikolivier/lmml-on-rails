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

class InBodyOrientation < ApplicationRecord
  enum coordinate_system: [:distal_proximal, :radial_ulnar,
                           :lateral_medial, :front_behind]

  validates :coordinate_system, presence: true
end
