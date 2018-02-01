class InternalGenitaliaExaminationDecorator < ExaminationBaseDecorator
  def no_injury_description
    return if any_injury?
    t('.no_injury')
  end

  def uterus_dimension_description
    phrase = PhraseBuilder.new(only_comma: true)
    phrase << length_chunk
    phrase << fundal_width_chunk
    phrase << cervical_width_chunk
    return if phrase.empty?
    t('.uterus_dimension', description: phrase.to_sentence_no_dot)
  end

  def endometrium_color_description
    return if object.endometrium_color.blank?
    t('.endometrium_color',
      color: object.translated_enum_value(:endometrium_color))
  end

  def ovaries_description
    return if object.ovaries_presence.blank?
    ovaries_presence_filled_description
  end

  private

  def length_chunk
    return if object.length.blank?
    t('.length', length: object.length)
  end

  def fundal_width_chunk
    return if object.fundal_width.blank?
    t('.fundal_width', width: object.fundal_width)
  end

  def cervical_width_chunk
    return if object.cervical_width.blank?
    t('.cervical_width', width: object.cervical_width)
  end

  def ovaries_presence_filled_description
    if object.ovaries_presence_yes?
      ovaries_presence_yes_description
    elsif object.ovaries_presence_left_is_missing?
      t('.left_ovary_missing')
    elsif object.ovaries_presence_right_is_missing?
      t('.right_ovary_missing')
    elsif object.ovaries_presence_no?
      t('.no_ovary')
    end
  end

  def ovaries_presence_yes_description
    if object.ovaries_distance.blank?
      t('.both_ovaries_no_distance')
    else
      t('.both_ovaries_distance', distance: object.ovaries_distance)
    end
  end
end
