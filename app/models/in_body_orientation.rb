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
  enum coordinate_system: %i[distal_proximal radial_ulnar
                             lateral_medial front_behind]

  validates :coordinate_system, presence: true

  before_save :set_x_y

  def distance
    return @distance if @distance.present?
    return nil if x.blank? || y.blank?
    Math.sqrt(x**2 + y**2)
  end

  def angle
    return @angle if @angle.present?
    return nil if x.blank? || y.blank?
    return 0 if x.zero?
    Math.atan(y / x)
  end

  def distance=(distance)
    @distance = distance.to_f
  end

  def angle=(angle)
    @angle = angle.to_f
  end

  private

  def set_x_y
    return if @distance.blank? || @angle.blank?
    self.x = @distance * Math.sin(@angle.degrees)
    self.y = @distance * Math.cos(@angle.degrees)
  end
end
