# == Schema Information
#
# Table name: livores_mortis
#
#  id                              :integer          not null, primary key
#  color                           :integer
#  position                        :integer
#  intensity                       :integer
#  on_finger_pressure              :integer
#  external_outline_examination_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class LivorMortis < ApplicationRecord
  enum color: %i(white pale yellow)
  enum position: %i(left_foot right_foot left_leg right_leg back belly
                    trunk head left_arm right_arm left_hand right_hand)
  enum intensity: Settings.enums.three_scale_intensity
  enum on_finger_pressure: %i(fades_with_light_pressure
                              fades_with_strong_pressure
                              does_not_fade)

  belongs_to :external_outline_examination, required: true
end
