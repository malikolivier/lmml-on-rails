# == Schema Information
#
# Table name: analysis_diatom_tests
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  conclusion  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisDiatomTest < AnalysisBase
  enum conclusion: %i[contradiction no_contradiction impossible_to_conclude]

  has_many :diatom_counts, -> { order(:category) }

  def description
    if left_lung.quantity.blank? && right.quantity.blank?
      '未記入な項目がございます。'
    else
      "#{first_paragraph}
    　<p>#{second_paragraph}</p>"
    end
  end

  def left_lung
    diatom_counts.left_lung.take
  end

  def right_lung
    diatom_counts.right_lung.take
  end

  private

  # TODO: refactor
  # rubocop:disable Metrics/LineLength
  def first_paragraph
    paragraph = '肺臓の一部につき、式に従って壊機試験を行なった。1回の鏡検で明らかな珪藻形態の有するもののみをカウントしたところ、'
    if right_lung.quantity == left_lung.quantity
      if left_lung.found?
        "#{paragraph}肺臓では#{left_lung.translated_quantity}（肺約２ｇを壊機し、ポアサイズ5μｍ、径25mmのメンブランフィルタ−上で200倍視野で鏡検したところ、#{left_lung.descriptive_quantity}の珪藻が観察）の珪藻が観察された。"
      else
        "#{paragraph}肺臓では検出されなかった（肺約２ｇを壊機し、ポアサイズ5μｍ、径25mmのメンブランフィルタ−上で200倍視野で鏡検したところ、珪藻が未観察）。"
      end
    else
      phrases = []
      descriptive_phrases = []
      if left_lung.quantity.present?
        phrases.push("左肺臓では#{left_lung.translated_quantity}")
        descriptive_phrases.push("左肺に#{left_lung.descriptive_quantity}")
      end
      if right_lung.quantity.present?
        phrases.push("右肺臓では#{right_lung.translated_quantity}")
        descriptive_phrases.push("左肺に#{right_lung.descriptive_quantity}")
      end
      paragraph += phrases.to_sentence_with_comma
      "#{paragraph}（肺約２ｇを壊機し、ポアサイズ5μｍ、径25mmのメンブランフィルタ−上で200倍視野で鏡検したところ、#{descriptive_phrases.to_sentence_with_comma}の珪藻が観察）の珪藻が観察された。"
    end
  end

  def second_paragraph
    water = diatom_counts.water_with_destruction.take
    if water.found?
      "なお、死体発見場所の対照水（約50mLを壊機し、同様に鏡検）に含まれる珪藻数は#{water.translated_quantity}レベルであり、#{conclusion_description}。"
    else
      "なお、死体発見場所の対照水（約50mLを壊機し、同様に鏡検）に含まれる珪藻数は検出されなく、#{conclusion_description}。"
    end
  end

  def conclusion_description
    I18n.t "diatom_test.conclusion.#{conclusion}"
  end
end
