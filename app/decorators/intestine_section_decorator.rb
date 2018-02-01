class IntestineSectionDecorator < ApplicationDecorator
  def description
    content_name = object.colon? ? t('.feces') : t('.contents')
    if object.quantity_none?
      t('.no_content', organ: organ_name, content: content_name)
    else
      t('.has_content', organ: organ_name, color: color_chunk,
                        content: content_name, quantity: quantity_chunk)
    end
  end

  private

  def organ_name
    object.translated_enum_value(:category)
  end

  def color_chunk
    return if object.color.blank?
    object.translated_enum_value(:color)
  end

  def quantity_chunk
    return if object.quantity.blank?
    object.translated_enum_value(:quantity)
  end
end
