class InternalThoracicAortaExaminationDecorator < ExaminationBaseDecorator
  def description
    phrase = PhraseBuilder.new(only_comma: true)
    phrase << t('.width', width: object.width) if object.width.present?
    phrase << arteriosclerosis_description
    phrase << t('.no_injury') unless any_injury?
    phrase.to_sentence
  end

  private

  def arteriosclerosis_description
    return if object.arteriosclerosis.blank?
    t('.arteriosclerosis',
      intensity: object.translated_enum_value(:arteriosclerosis))
  end
end
