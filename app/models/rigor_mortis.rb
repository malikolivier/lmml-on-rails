# == Schema Information
#
# Table name: rigores_mortis
#
#  id                              :integer          not null, primary key
#  joint                           :integer          not null
#  intensity                       :integer
#  category                        :integer
#  external_outline_examination_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class RigorMortis < ApplicationRecord
  enum joint: [:chin, :neck, :left_shoulder, :right_shoulder, :left_elbow,
               :right_elbow, :left_hand, :right_hand, :left_hip, :right_hip,
               :left_knee, :right_knee, :left_foot, :right_foot]
  enum intensity: Settings.enums.five_scale_intensity
  enum category: [:rigor_mortis, :heat_related, :freeze_related]

  validates :joint, presence: true

  belongs_to :external_outline_examination, required: true
end
