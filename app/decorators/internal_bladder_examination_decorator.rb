class InternalBladderExaminationDecorator < ExaminationBaseDecorator
  def content_description
    return if object.urine_quantity.blank?
    if object.urine_quantity.zero?
      t('.empty')
    else
      t('.content', color: urine_color_chunk,
                    transparency: urine_transparency_chunk,
                    quantity: urine_quantity_chunk)
    end
  end

  def membrane_description
    return if object.membrane_color.blank?
    t('.membrane', color: object.translated_enum_value(:membrane_color))
  end

  private

  def urine_color_chunk
    return if object.urine_color.blank?
    object.translated_enum_value(:urine_color)
  end

  def urine_transparency_chunk
    return if object.urine_transparency.blank?
    object.translated_enum_value(:urine_transparency)
  end

  def urine_quantity_chunk
    return if object.urine_quantity.blank?
    t('.urine_quantity', quantity: object.urine_quantity)
  end
end
