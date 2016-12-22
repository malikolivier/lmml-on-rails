# == Schema Information
#
# Table name: internal_pancreas_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  hardness       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalPancreasExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum hardness: Settings.enums.hardness

  def description
    description = ''
    description += "硬度は#{I18n.t "hardness.#{hardness}"}。" if hardness.present?
    description += '肉眼的に出血・脂肪壊死の異常なし。' if examination.injuries.none?
    description
  end
end
