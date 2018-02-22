class GallBladderDecorator < ApplicationDecorator
  def description
    h.join_sentences(bile_description, gallstones_description)
  end

  private

  # rubocop:disable AbcSize, MethodLength
  def bile_description
    return if object.bile_quantity.blank?
    if object.bile_none?
      t('.no_bile')
    elsif object.bile_unknown?
      t('.bile_unknown')
    elsif object.bile_color.blank?
      t('.bile_quantity',
        quantity: object.translated_enum_value(:bile_quantity))
    else
      t('.bile_color_quantity',
        color: object.translated_enum_value(:bile_color),
        quantity: object.translated_enum_value(:bile_quantity))
    end
  end
  # rubocop:enable AbcSize, MethodLength

  def gallstones_description
    return if object.gallstones_quantity.blank?
    if object.gallstones_none?
      t('.no_gallstones')
    else
      h.join_sentences(gallstones_color_quantity_description,
                       gallstones_size_description)
    end
  end

  def gallstones_color_quantity_description
    return if object.gallstones_quantity.blank?
    if object.gallstones_color.blank?
      t('.gallstones_quantity',
        quantity: object.translated_enum_value(:gallstones_quantity))
    else
      t('.gallstones_color_quantity',
        color: object.translated_enum_value(:gallstones_color),
        quantity: object.translated_enum_value(:gallstones_quantity))
    end
  end

  def gallstones_size_description
    return if object.gallstones_size.blank?
    t('.gallstones_size', size: object.translated_enum_value(:gallstones_size))
  end
end
