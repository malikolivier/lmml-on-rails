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
  enum urine_color: %i(unknown yellowish yellow amber red
                       brown), _prefix: true
  enum urine_transparency: %i(unknown transparent opaque), _prefix: 'urine'
  enum membrane_color: %i(unknown pale), _prefix: true

  def description
    description = content_description
    if membrane_color.present?
      description += "粘膜#{I18n.t("colors.#{membrane_color}")}。"
    end
    description
  end

  def translated_color
    urine_color.present? ? I18n.t("colors.#{urine_color}") : ''
  end

  def translated_transparency
    transparency = I18n.t("transparency.#{urine_transparency}")
    urine_transparency.present? ? transparency : ''
  end

  def translated_quantity
    "#{urine_quantity}mL"
  end

  def content_description
    return '' if urine_quantity.blank?
    if urine_quantity.zero?
      '空虚。'
    else
      "内に#{translated_color}#{translated_transparency}尿" \
      "#{translated_quantity}あり。"
    end
  end
end
