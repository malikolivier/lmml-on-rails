class ExternalGenitaliaExaminationDecorator < ExaminationBaseDecorator
  def hair_description
    if model.hair_color.present?
      hair_description_with_color
    elsif model.hair_length.present?
      t('.hair_length', length: model.hair_length)
    end
  end

  def sex_description
    if !model.O?
      t('.sex', sex: model.translated_enum_value(:sex))
    else
      t('.unknown_sex')
    end
  end

  private

  def hair_description_with_color
    if model.hair_length.present?
      t('.hair_color_length', color: model.translated_enum_value(:hair_color),
                              length: model.hair_length)
    else
      t('.hair_color', color: model.translated_enum_value(:hair_color))
    end
  end
end
