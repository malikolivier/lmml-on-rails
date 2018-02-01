class ExternalEyeExaminationDecorator < DualRecordDecorator
  delegate :aperture, :closed, :eye_closed?, :eye_open?

  def closedness_description
    return '' if model.eye_other? || model.closed.blank?
    t('.closedness_description', deixis: translated_deixis,
                                 aperture_chunk: aperture_chunk,
                                 closedness: closedness_chunk)
  end

  def details
    h.join_sentences(eyelid_congestion_description,
                     eyelid_petechia_description,
                     PhraseBuilder.new(model.eyelid_note).to_sentence,
                     conjunctiva_congestion_description,
                     conjunctiva_petechia_description,
                     PhraseBuilder.new(model.conjunctiva_note).to_sentence)
  end

  def cornea_description
    return '' if model.cornea.blank?
    t('.cornea_description', deixis: translated_deixis, cornea: model.cornea)
  end

  def pupil_description
    return '' if model.pupil.blank?
    t('.pupil_description', deixis: translated_deixis, pupil: model.pupil)
  end

  def diameter_description
    return '' if model.diameter.blank?
    t('.diameter_description', deixis: translated_deixis,
                               diameter: model.diameter)
  end

  def aperture_chunk
    return '' unless eye_open? && aperture.present? && aperture.positive?
    t('.aperture_chunk', aperture: aperture)
  end

  def closedness_chunk
    model.translated_enum_value(:closed)
  end

  private

  def eyelid_congestion_description
    return '' if model.eyelid_congestion.blank?
    intensity_desc = model.translated_enum_value(:eyelid_congestion)
    t('.eyelid_congestion_description', deixis: translated_deixis,
                                        intensity: intensity_desc)
  end

  def eyelid_petechia_description
    return '' if model.eyelid_petechia.blank?
    quantity_desc = model.translated_enum_value(:eyelid_petechia)
    t('.eyelid_petechia_description', deixis: translated_deixis,
                                      quantity: quantity_desc)
  end

  def conjunctiva_congestion_description
    return '' if model.conjunctiva_congestion.blank?
    intensity_desc = model.translated_enum_value(:conjunctiva_congestion)
    t('.conjunctiva_congestion_description', deixis: translated_deixis,
                                             intensity: intensity_desc)
  end

  def conjunctiva_petechia_description
    return '' if model.conjunctiva_petechia.blank?
    quantity_desc = model.translated_enum_value(:conjunctiva_petechia)
    t('.conjunctiva_petechia_description', deixis: translated_deixis,
                                           quantity: quantity_desc)
  end
end
