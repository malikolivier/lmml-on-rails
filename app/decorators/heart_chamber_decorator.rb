class HeartChamberDecorator < ApplicationDecorator
  delegate :size, :left_ventricle?, :right_ventricle?,
           :left_atrium?, :right_atrium?
end
