# == Schema Information
#
# Table name: internal_genitalia_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  length            :float
#  fundal_width      :float
#  cervical_width    :float
#  endometrium_color :integer
#  ovaries_presence  :integer
#  ovaries_distance  :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalGenitaliaExamination < ExaminationBase
  enum endometrium_color: %i(unknown pale), _prefix: true
  enum ovaries_presence: %i(unknown yes left_is_missing right_is_missing
                            no), _prefix: true

  def description
    description = ''
    description += '子宮に位置や形の異常なし。' if examination.injuries.none?
    description += uterus_dimension_description
    description += "内膜は#{I18n.t("colors.#{endometrium_color}")}。" if endometrium_color.present?
    description + ovaries_description
  end

  def uterus_dimension_description
    phrases = []
    phrases.push("長さ#{length}㎝") if length.present?
    phrases.push("幅底部で#{fundal_width}㎝") if fundal_width.present?
    phrases.push("頸部で#{cervical_width}㎝") if cervical_width.present?
    if phrases.any?
      "子宮は#{phrases.to_sentence_with_comma}。"
    else
      ''
    end
  end

  def ovaries_description # rubocop:disable Metrics/CyclomaticComplexity
    if ovaries_presence.present?
      case ovaries_presence
      when 'yes'
        output = '卵巣は左右共'
        output += "#{ovaries_distance}cm大" if ovaries_distance.present?
        "#{output}。"
      when 'left_is_missing'
        '左卵巣は損失する。'
      when 'right_is_missing'
        '右卵巣は損失する。'
      when 'no'
        '左右卵巣は損失する。'
      else
        "Unhandled ovaries_presence: #{ovaries_presence}"
      end
    else
      ''
    end
  end
end
