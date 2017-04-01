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

  enum hardness: Settings.enums.hardness
  enum capsule_removal: %i(easy hard unknown), _prefix: true
  enum capsule_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum pelvis_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum pelvis_petechia: Settings.enums.five_scale_quantity, _prefix: true

  def description
    description = ''
    description += "硬度は#{I18n.t "hardness.#{hardness}"}。" if hardness.present?
    description += capsule_description
    description += pelvis_description
    description
  end

  def capsule_description
    capsule_phrases = []
    if capsule_removal.present?
      capsule_phrases.push("被膜剥離#{I18n.t "difficulty.#{capsule_removal}"}")
    end
    if capsule_congestion.present?
      capsule_phrases.push("鬱血#{I18n.t "intensity.#{capsule_congestion}"}")
    end
    capsule_phrases.to_sentence_with_comma_and_full_stop
  end

  def pelvis_description
    pelvis_phrases = []
    if pelvis_congestion.present?
      pelvis_phrases.push("血管充盈#{I18n.t "intensity.#{pelvis_congestion}"}")
    end
    if pelvis_petechia.present?
      pelvis_phrases.push("溢血点#{I18n.t "quantity.#{pelvis_petechia}"}")
    end
    pelvis_phrases.to_sentence_with_comma_and_full_stop
  end
end
