# == Schema Information
#
# Table name: livores_mortis
#
#  id                              :integer          not null, primary key
#  color                           :integer
#  position                        :integer
#  intensity                       :integer
#  on_fingure_pressure             :integer
#  external_outline_examination_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class LivorMortis < ApplicationRecord
  enum color: [:white, :pale, :yellow]
  enum position: [:left_leg, :right_leg]
  enum intensity: [:light, :mid, :strong]
  enum on_fingure_pressure: [:fades_with_light_pressure,
                             :fades_with_strong_pressure,
                             :does_not_fade]

  belongs_to :external_outline_examination, required: true
end
