class LivoresMortisDecorator < ApplicationCollectionDecorator
  def description
    pb = PhraseBuilder.new(only_comma: true)
    object.group_by(&:intensity).each do |intensity, livores|
      if intensity == 'absent'
        parts = body_parts(livores)
        pb << t('.body_parts_absent_description', body_parts: parts)
        next
      end
      int_desc = LivorMortisDecorator.intensity_description(intensity)
      livores.group_by(&:color).each do |color, livores_|
        t_color = LivorMortis.translated_enum_value(:color, color) || ''
        color_desc = t('.color_description', color: t_color)
        livores_.group_by(&:on_finger_pressure).each do |finger, livores__|
          parts = body_parts(livores__)
          parts_desc = t('.body_parts_description', body_parts: parts)
          first_part = t('.1st_part_description',
                         body_parts: parts_desc, color: color_desc,
                         intensity: int_desc)
          finger_desc = LivorMortis.translated_enum_value(:on_finger_pressure,
                                                          finger) || ''
          pb << t('.single_description', '1st_part': first_part,
                                         finger: finger_desc)
        end
      end
    end
    t('.complete_description', livores_mortis: pb.to_sentence_no_dot)
  end

  private

  def body_parts(livores_mortis = self)
    h.join_words(livores_mortis.map do |livor|
                   livor.translated_enum_value(:position)
                 end)
  end
end
