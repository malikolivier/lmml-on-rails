class InternalPancreasExaminationDecorator < ExaminationBaseDecorator
  def hardness_description
    return if object.hardness.blank?
    t('.hardness', hardness: object.translated_enum_value(:hardness))
  end

  def no_injury_description
    return if any_injury?
    t('.no_injury')
  end
end
