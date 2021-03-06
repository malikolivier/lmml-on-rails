class InternalKidneysExaminationDecorator < DualExaminationBaseDecorator
  def weight_description
    return if object.weight.blank?
    t('.weight', deixis: translated_deixis, weight: object.weight)
  end

  def description
    h.join_sentences([hardness_description,
                      capsule_description,
                      pelvis_description])
  end

  def description_with_deixis
    desc = description
    return if desc.blank?
    t('.organ_description', deixis: translated_deixis, description: desc)
  end

  private

  def hardness_description
    return if object.hardness.blank?
    t('.hardness', hardness: object.translated_enum_value(:hardness))
  end

  # rubocop:disable AbcSize
  def capsule_description
    phrase = PhraseBuilder.new(only_comma: true)
    if object.capsule_removal.present?
      phrase << t('.capsule_removal',
                  intensity: object.translated_enum_value(:capsule_removal))
    end
    if object.capsule_congestion.present?
      phrase << t('.capsule_congestion',
                  intensity: object.translated_enum_value(:capsule_congestion))
    end
    phrase.to_sentence
  end

  def pelvis_description
    phrase = PhraseBuilder.new(only_comma: true)
    if object.pelvis_congestion.present?
      phrase << t('.pelvis_congestion',
                  intensity: object.translated_enum_value(:pelvis_congestion))
    end
    if object.pelvis_petechia.present?
      phrase << t('.pelvis_petechia',
                  quantity: object.translated_enum_value(:pelvis_petechia))
    end
    phrase.to_sentence
  end
  # rubocop:enable AbcSize
end
