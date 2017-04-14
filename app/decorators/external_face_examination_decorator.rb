class ExternalFaceExaminationDecorator < ExaminationBaseDecorator
  decorates_association :external_eye_examinations
  decorates_association :external_mouth_examination

  def congestion_swelling_description
    pb = PhraseBuilder.new(only_comma: true)
    pb << congestion_description if model.congestion.present?
    pb << swelling_description if model.swelling.present?
    pb.to_sentence
  end

  def eyes_description
    sentences = []
    sentences << external_eye_examinations.closedness_description
    sentences << external_eye_examinations.left_eye_details
    sentences << external_eye_examinations.right_eye_details
    sentences << external_eye_examinations.dimensions_description
    h.join_sentences(sentences)
  end

  def nasal_cavity_description
    return '' if model.nasal_cavity_content.blank?
    t('.nasal_cavity_description', content: model.nasal_cavity_content)
  end

  def mouth_description
    return '' if model.external_mouth_examination.blank?
    external_mouth_examination.description
  end

  private

  def congestion_description
    if model.congestion_unknown?
      t('.congestion_unknown')
    elsif model.congestion_exists?
      t('.has_congestion')
    elsif model.congestion_does_not_exist?
      t('.no_congestion')
    end
  end

  def swelling_description
    intensity_desc = model.translated_enum_value(:swelling)
    t('.swelling_description', intensity: intensity_desc)
  end
end
