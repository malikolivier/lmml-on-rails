class ExternalHeadExaminationDecorator < ExaminationBaseDecorator
  decorates_association :external_ear_examinations

  def hair_color_description
    natural_color = model.translated_enum_value(:hair_natural_color)
    dyed_color = model.translated_enum_value(:hair_dyed_color)
    hair_color_description_text(natural_color, dyed_color)
  end

  def hair_length_description
    pb = PhraseBuilder.new(only_comma: true)
    pb << top_hair_length_description
    pb << side_hair_length_description
    t('.hair_length_description', description: pb.to_sentence) if pb.any?
  end

  def ears_description
    external_ear_examinations.description
  end

  private

  def hair_color_description_text(natural_color, dyed_color)
    if model.hair_natural_color.present?
      if model.not_dyed_or_not_specified?
        t('.natural_hair_color_only', natural: natural_color)
      else
        t('.all_hair_colors', natural: natural_color, dyed: dyed_color)
      end
    elsif model.hair_dyed_color.present?
      t('.dyed_hair_color_only', dyed: dyed_color)
    end
  end

  def top_hair_length_description
    return if model.top_hair_length.blank?
    t('.top_hair_length_description', length: model.top_hair_length)
  end

  def side_hair_length_description
    return if model.side_hair_length.blank?
    t('.side_hair_length_description', length: model.side_hair_length)
  end
end
