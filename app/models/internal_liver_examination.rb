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

class InternalLiverExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum hardness: Settings.enums.hardness
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum steatosis: Settings.enums.five_scale_intensity, _prefix: true

  has_one :gall_bladder

  def description
    description = ''
    description += "#{weight}g。" if weight.present?
    description += "硬度は#{I18n.t "hardness.#{hardness}"}。" if hardness.present?
    description += "鬱血は#{I18n.t "intensity.#{congestion}"}。" if congestion.present?
    description += "肉眼的に脂肪変性#{I18n.t "intensity.#{steatosis}"}。" if steatosis.present?
    description += '胆管・血管に異常なし。' if examination.injuries.none?
    description += gall_bladder.description
    description
  end
end
