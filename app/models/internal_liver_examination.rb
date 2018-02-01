# == Schema Information
#
# Table name: internal_liver_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  hardness       :integer
#  congestion     :integer
#  steatosis      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalLiverExamination < ExaminationBase
  enum hardness: Settings.enums.hardness
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum steatosis: Settings.enums.five_scale_intensity, _prefix: true,
       i18n_key: :intensity

  has_one :gall_bladder, inverse_of: :internal_liver_examination

  # TODO: Refactor
  # rubocop:disable Metrics/LineLength
  def description
    description = ''
    description += "#{weight}g。" if weight.present?
    description += "硬度は#{I18n.t "hardness.#{hardness}"}。" if hardness.present?
    description += "鬱血は#{I18n.t "intensity.#{congestion}"}。" if congestion.present?
    description += "肉眼的に脂肪変性#{I18n.t "intensity.#{steatosis}"}。" if steatosis.present?
    description += '胆管・血管に異常なし。' if examination.injuries.none?
    description += gall_bladder_description
    description
  end

  def gall_bladder_description
    if gall_bladder.present?
      gall_bladder.description
    else
      ''
    end
  end

  accepts_nested_attributes_for :gall_bladder, update_only: true

  includes_in_json :gall_bladder
end
