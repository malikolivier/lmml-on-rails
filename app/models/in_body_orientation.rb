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
  enum coordinate_system: Settings.enums.coordinate_system

  before_save :set_x_y

  def distance
    return @distance if @distance.present?
    return nil if x.blank? || y.blank?
    Math.sqrt(x**2 + y**2)
  end

  def angle
    # First perform checks for specific values and edge cases
    return @angle if @angle.present?
    return nil if x.blank? || y.blank?
    # Return the angle now assuming all values are present and not zero
    angle_no_check
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
    self.x = @distance * Math.cos(@angle.degrees)
    self.y = @distance * Math.sin(@angle.degrees)
  end

  def angle_no_check
    result = if x.zero? && !y.zero?
               Math::PI / 2
             else
               Math.atan2(y, x)
             end
    result -= Math::PI if y.negative?
    result.to_deg
  end
end
