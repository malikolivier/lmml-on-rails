class AnalysisCarbonMonoxideDecorator < AnalysisBaseDecorator
  def description
    pb = PhraseBuilder.new(only_comma: true)
    pb << left_heart_description
    pb << right_heart_description
    pb << iliac_vein_description
    t('.full_description', result: pb.to_sentence_no_dot)
  end

  private

  def left_heart_description
    return '' if object.left_heart_saturation.blank?
    t('.left_heart', saturation: object.left_heart_saturation)
  end

  def right_heart_description
    return '' if object.right_heart_saturation.blank?
    t('.right_heart', saturation: object.right_heart_saturation)
  end

  def iliac_vein_description
    return '' if object.iliac_vein_saturation.blank?
    t('.iliac_vein', saturation: object.iliac_vein_saturation)
  end
end
