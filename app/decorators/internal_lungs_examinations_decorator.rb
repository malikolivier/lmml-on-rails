class InternalLungsExaminationsDecorator < DualExaminationBasesDecorator
  def weight_description
    phrase = PhraseBuilder.new(only_comma: true)
    if attribute_equal_and_present?(:weight)
      phrase << t('.same_weight', weight: paired_attribute(:weight))
    else
      phrase << left&.weight_description
      phrase << right&.weight_description
    end
    phrase.to_sentence
  end

  def air_content_congestion_description
    phrase = PhraseBuilder.new(only_comma: true)
    if all_symetric?
      phrase << left&.air_content_description
      phrase << left&.congestion_description
    else
      phrase << air_content_description
      phrase << congestion_description
    end
    phrase.to_sentence
  end

  def no_injury_misc_description
    return if any_injury?
    t('.no_injury_misc')
  end

  def foreign_fluids_description
    if both_present? && left.foreign_fluids.none? && right.foreign_fluids.none?
      t('.no_foreign_fluid')
    else
      "#{left&.foreign_fluids_description}#{right&.foreign_fluids_description}"
    end
  end

  def no_injury_lymph_description
    return if any_injury?
    t('.no_injury_lymph')
  end

  private

  def all_symetric?
    attribute_equal?(:air_content) && attribute_equal?(:congestion)
  end

  def air_content_description
    phrase = PhraseBuilder.new(only_comma: true)
    if attribute_equal_and_present?(:air_content)
      phrase << t('.same_air_content',
                  quantity: translated_paired_attribute(:air_content))
    else
      phrase << left&.air_content_description_with_deixis
      phrase << right&.air_content_description_with_deixis
    end
    return if phrase.empty?
    t('.air_content_description', chunk: phrase.to_sentence_no_dot)
  end

  def congestion_description
    phrase = PhraseBuilder.new(only_comma: true)
    if attribute_equal_and_present?(:congestion)
      phrase << t('.same_congestion',
                  intensity: translated_paired_attribute(:congestion))
    else
      phrase << left&.congestion_description_with_deixis
      phrase << right&.congestion_description_with_deixis
    end
    return if phrase.empty?
    t('.congestion_description', chunk: phrase.to_sentence_no_dot)
  end
end
