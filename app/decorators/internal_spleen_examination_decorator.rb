class InternalSpleenExaminationDecorator < ExaminationBaseDecorator
  def weight_description
    return if object.weight.blank?
    t('.weight', weight: object.weight)
  end

  def hardness_congestion_description
    phrases = PhraseBuilder.new(only_comma: true)
    phrases << hardness_chunk
    phrases << congestion_chunk
    phrases.to_sentence
  end

  def pulp_distinct_description
    return if object.pulp_distinct.blank?
    t('.pulp_distinct', clarity: object.translated_enum_value(:pulp_distinct))
  end

  private

  def hardness_chunk
    return if object.hardness.blank?
    t('.hardness', hardness: object.translated_enum_value(:hardness))
  end

  def congestion_chunk
    return if object.congestion.blank?
    t('.congestion', intensity: object.translated_enum_value(:congestion))
  end
end
