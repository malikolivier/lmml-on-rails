# == Schema Information
#
# Table name: internal_spleen_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  hardness       :integer
#  congestion     :integer
#  pulp_distinct  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalSpleenExamination < ExaminationBase
  enum hardness: Settings.enums.hardness, i18n_key: :hardness
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum pulp_distinct: %i[clear unclear unknown], _prefix: true,
       i18n_key: :clarity

  def description
    description = ''
    phrases = []
    phrases.push("硬度は#{I18n.t "hardness.#{hardness}"}") if hardness.present?
    phrases.push("鬱血#{I18n.t "intensity.#{congestion}"}") if congestion.present?
    description += phrases.to_sentence_with_comma_and_full_stop
    if pulp_distinct.present?
      description += "赤脾髄・白脾髄の別は#{I18n.t "clarity.#{pulp_distinct}"}。"
    end
    description
  end
end
