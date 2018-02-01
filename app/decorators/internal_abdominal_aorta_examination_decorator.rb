class InternalAbdominalAortaExaminationDecorator < ExaminationBaseDecorator
  def arteriosclerosis_description
    return if object.arteriosclerosis.blank?
    t('.arteriosclerosis',
      intensity: object.translated_enum_value(:arteriosclerosis))
  end
end
