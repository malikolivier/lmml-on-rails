class ExternalOutlineExaminationDecorator < ExaminationDecorator
  decorates_association :livores_mortis
  decorates_association :rigores_mortis

  def sex_description
    if !model.O? && model.sex.present?
      sex = t("sex.#{model.sex}")
      t('.body_sex', sex: sex)
    else
      t('.unknown_sex')
    end
  end

  def height_weight_description # rubocop:disable AbcSize
    pb = PhraseBuilder.new(only_comma: true)
    if model.height.present?
      desc = t('.height_description', label: height_label, height: model.height)
      pb << desc
    end
    if model.weight.present?
      desc = t('.weight_description', label: weight_label, weight: model.weight)
      pb << desc
    end
    pb.to_sentence
  end

  def constitution_description
    t('.constitution', constitution: model.translated_enum_value(:constitution))
  end

  def livores_mortis_description
    note = PhraseBuilder.new(model.livor_mortis_note).to_sentence
    h.join_sentences(livores_mortis.description, note)
  end

  def rigores_mortis_description
    note = PhraseBuilder.new(model.rigor_mortis_note).to_sentence
    h.join_sentences(rigores_mortis.description, note)
  end

  def temperature_description
    phrases = []
    if model.rectal_temperature.present?
      phrases << t('.cold_phrase') if model.cold
      phrases << t('.rectal_description', temperature: model.rectal_temperature)
    else
      phrases << t('.cold_sentence')
    end
    if model.room_temperature.present?
      phrases << t('.room_temperature', temperature: model.room_temperature)
    end
    h.join_sentences(phrases)
  end
  private

  def height_label
    model.partial_body ? t('.partial_height') : t('.height')
  end

  def weight_label
    model.partial_body ? t('.partial_height') : t('.height')
  end
end
