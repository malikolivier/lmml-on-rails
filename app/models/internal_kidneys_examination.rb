# == Schema Information
#
# Table name: internal_kidneys_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  deixis             :integer          not null
#  weight             :float
#  hardness           :integer
#  capsule_removal    :integer
#  capsule_congestion :integer
#  pelvis_congestion  :integer
#  pelvis_petechia    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InternalKidneysExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum deixis: [:left, :right]

  enum hardness: [:hard, :soft, :unknown]
  enum capsule_removal: [:easy, :hard, :unknown], _prefix: true
  enum capsule_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum pelvis_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum pelvis_petechia: Settings.enums.five_scale_quantity, _prefix: true
end
