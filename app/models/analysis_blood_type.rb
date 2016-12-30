# == Schema Information
#
# Table name: analysis_blood_types
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  anti_a      :integer
#  anti_b      :integer
#  anti_h      :integer
#  blood_type  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisBloodType < ApplicationRecord
  belongs_to :analysis, required: true

  enum anti_a: Settings.enums.tests.binary_result, _prefix: true
  enum anti_b: Settings.enums.tests.binary_result, _prefix: true
  enum anti_h: Settings.enums.tests.binary_result, _prefix: true
  enum blood_type: [:A, :B, :O, :AB, :unknown]

  def description
    return '未記入な項目がございます。' if tried_antibodies.empty?
    description = "心臓血の一部を生理食塩水でよく洗い、遠心分離した血球の微量をホールグラス上で#{tried_antibodies.join('・')}血清と反応させたところ、"
    if positive_tries.any?
      description += "#{positive_tries.join('・')}血清とは明らかに陽性の凝集反応を示したが、"
    else
      description += "明らかに陽性の凝集反応を示した血清はなかったが、"
    end
    if negative_tries.any?
      description += "#{negative_tries.join('・')}血清とは明らかに反応が陰性であった。"
    else
      description += "明らかに反応が陰性であった血清がなかった。"
    end
    description
  end

  private

  def tried_antibodies
    tried_antis = []
    tried_antis.push('抗Ａ') if anti_a.present?
    tried_antis.push('抗Ｂ') if anti_b.present?
    tried_antis.push('抗Ｈ') if anti_h.present?
    tried_antis
  end

  def positive_tries
    tried_antis = []
    tried_antis.push('抗Ａ') if anti_a_positive?
    tried_antis.push('抗Ｂ') if anti_b_positive?
    tried_antis.push('抗Ｈ') if anti_h_positive?
    tried_antis
  end

  def negative_tries
    tried_antis = []
    tried_antis.push('抗Ａ') if anti_a_negative?
    tried_antis.push('抗Ｂ') if anti_b_negative?
    tried_antis.push('抗Ｈ') if anti_h_negative?
    tried_antis
  end
end
