# == Schema Information
#
# Table name: in_body_orientations
#
#  id                :integer          not null, primary key
#  coordinate_system :integer
#  x                 :float
#  y                 :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class InBodyOrientationTest < ActiveSupport::TestCase
  PRECISION = 1e-9

  test 'Distance and angle are 0' do
    orientation = InBodyOrientation.new(x: 0, y: 0)
    assert_in_delta(orientation.distance, 0, PRECISION)
    assert_in_delta(orientation.angle, 0, PRECISION)
  end

  test 'X and Y are 0' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: 0, angle: 0)
    assert_in_delta(orientation.x, 0, PRECISION)
    assert_in_delta(orientation.y, 0, PRECISION)
  end

  test 'Distance = 10 and angle = 0' do
    orientation = InBodyOrientation.new(x: 10, y: 0)
    assert_in_delta(orientation.distance, 10, PRECISION)
    assert_in_delta(orientation.angle, 0, PRECISION)
  end

  test 'X = 10 and Y = 0' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: 10, angle: 0)
    assert_in_delta(orientation.x, 10, PRECISION)
    assert_in_delta(orientation.y, 0, PRECISION)
  end

  test 'Distance = 10 and angle = 90' do
    orientation = InBodyOrientation.new(x: 0, y: 10)
    assert_in_delta(orientation.distance, 10, PRECISION)
    assert_in_delta(orientation.angle, 90, PRECISION)
  end

  test 'X = 0 and Y = 10' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: 10, angle: 90)
    assert_in_delta(orientation.x, 0, PRECISION)
    assert_in_delta(orientation.y, 10, PRECISION)
  end

  test 'Distance = 10 and angle = -90' do
    orientation = InBodyOrientation.new(x: 0, y: -10)
    assert_in_delta(orientation.distance, 10, PRECISION)
    assert_in_delta(orientation.angle, -90, PRECISION)
  end

  test 'X = 0 and Y = -10' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: 10, angle: -90)
    assert_in_delta(orientation.x, 0, PRECISION)
    assert_in_delta(orientation.y, -10, PRECISION)
  end

  test 'Distance = 10 and angle = 180' do
    orientation = InBodyOrientation.new(x: -10, y: 0)
    assert_in_delta(orientation.distance, 10, PRECISION)
    assert_in_delta(orientation.angle, 180, PRECISION)
  end

  test 'X = -10 and Y = 0' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: 10, angle: 180)
    assert_in_delta(orientation.x, -10, PRECISION)
    assert_in_delta(orientation.y, 0, PRECISION)
  end

  test 'Distance = 10 and angle = 45' do
    orientation = InBodyOrientation.new(x: 10, y: 10)
    assert_in_delta(orientation.distance, Math.sqrt(200), PRECISION)
    assert_in_delta(orientation.angle, 45, PRECISION)
  end

  test 'X = 10 and Y = 10' do
    orientation = InBodyOrientation.create!(coordinate_system: 'radial_ulnar',
                                            distance: Math.sqrt(200), angle: 45)
    assert_in_delta(orientation.x, 10, PRECISION)
    assert_in_delta(orientation.y, 10, PRECISION)
  end
end
