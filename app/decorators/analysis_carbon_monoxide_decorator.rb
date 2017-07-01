class AnalysisCarbonMonoxideDecorator < AnalysisBaseDecorator
  def description
    pb = PhraseBuilder.new(only_comma: true)
    pb << "左心血で約#{object.left_heart_saturation}%" if object.left_heart_saturation.present?
    pb << "右心血で約#{object.left_heart_saturation}%" if object.right_heart_saturation.present?
    pb << "総腸骨静脈血で約#{object.iliac_vein_saturation}%" if object.iliac_vein_saturation.present?
    "本屍の心臓血および総腸骨静脈血について、吸光度法にて血中ヘモグロビンの一酸化炭素飽和度を検査したところ、#{pb.to_sentence_no_dot}であった。"
  end
end
