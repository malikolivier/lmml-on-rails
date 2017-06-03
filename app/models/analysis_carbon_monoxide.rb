# == Schema Information
#
# Table name: analysis_carbon_monoxides
#
#  id                     :integer          not null, primary key
#  analysis_id            :integer
#  left_heart_saturation  :float
#  right_heart_saturation :float
#  iliac_vein_saturation  :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class AnalysisCarbonMonoxide < AnalysisBase
  # TODO: Refactor
  # rubocop:disable Metrics/LineLength
  def description
    results = []
    results.push("左心血で約#{left_heart_saturation}%") if left_heart_saturation.present?
    results.push("右心血で約#{right_heart_saturation}%") if right_heart_saturation.present?
    results.push("総腸骨静脈血で約#{iliac_vein_saturation}%") if iliac_vein_saturation.present?
    "本屍の心臓血および総腸骨静脈血について、吸光度法にて血中ヘモグロビンの一酸化炭素飽和度を検査したところ、#{results.to_sentence_with_comma}であった。"
  end
end
