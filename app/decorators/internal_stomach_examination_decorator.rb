class InternalStomachExaminationDecorator < ExaminationBaseDecorator
  def content_description
    return if object.content_quantity.blank?
    if almost_empty?
      t('.almost_empty')
    else
      filled_stomach_description
    end
  end

  def rugae_description
    if object.rugae_persistent?
      t('.rugae_persistent')
    elsif object.rugae_not_persistent?
      t('.rugae_not_persistent')
    end
  end

  private

  def almost_empty?
    object.content_quantity < 1
  end

  def filled_stomach_description
    digestion = content_digestion_description
    aspect = content_aspect_description
    color = content_color_description
    quantity = content_quality_description
    t('.filled_stomach', digestion: digestion, aspect: aspect, color: color,
                         quantity: quantity)
  end

  def content_digestion_description
    return if object.content_digestion.blank?
    object.translated_enum_value(:content_digestion)
  end

  def content_aspect_description
    return if object.content_aspect.blank?
    object.translated_enum_value(:content_aspect)
  end

  def content_color_description
    return if object.content_color.blank?
    object.translated_enum_value(:content_color)
  end

  def content_quality_description
    return if object.content_quantity.blank?
    t('.content_quality', quantity: object.content_quantity)
  end
end
