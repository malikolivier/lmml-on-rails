# == Schema Information
#
# Table name: internal_bladder_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  urine_color        :integer
#  urine_quantity     :float
#  urine_transparency :integer
#  membrane_color     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InternalBladderExamination < ExaminationBase
  enum urine_color: [:yellowish, :yellow, :amber, :red, :brown], _prefix: true
  enum urine_transparency: [:transparent, :opaque], _prefix: 'urine'
  enum membrane_color: [:pale], _prefix: true

  def description
    description = content_description
    description += "粘膜#{I18n.t "colors.#{membrane_color}"}。"
    description
  end

  def translated_color
    urine_color.present? ? I18n.t("colors.#{urine_color}") : ''
  end

  def translated_transparency
    urine_transparency.present? ? I18n.t("transparency.#{urine_transparency}") : ''
  end

  def translated_quantity
    "#{urine_quantity}mL"
  end

  def content_description
    if urine_quantity.zero?
      '空虚。'
    else
      "内に#{translated_color}#{translated_transparency}尿#{translated_quantity}あり。"
    end
  end
end
