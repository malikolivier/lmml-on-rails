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

class InternalKidneysExamination < ExaminationBase
  enum deixis: Settings.enums.deixes

  enum hardness: Settings.enums.hardness, i18n_key: :hardness
  enum capsule_removal: Settings.enums.five_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum capsule_congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum pelvis_congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum pelvis_petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity
end
