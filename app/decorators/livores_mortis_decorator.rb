class LivoresMortisDecorator < ApplicationCollectionDecorator
  def description
    pb = PhraseBuilder.new(only_comma: true)
    object.group_by(&:intensity).each do |intensity, livores|
      if intensity == 'absent'
        parts = body_parts(livores)
        pb << t('.body_parts_absent_description', body_parts: parts)
        next
      end
      build_single_description(pb, intensity, livores)
    end
    t('.complete_description', livores_mortis: pb.to_sentence_no_dot)
  end

  private

  def body_parts(livores_mortis = self)
    h.join_words(livores_mortis.map do |livor|
                   livor.translated_enum_value(:position)
                 end)
  end

  def build_single_description(pb, intensity, livores_mortis)
    intensity_desc = LivorMortisDecorator.intensity_description(intensity)
    livores_mortis.group_by(&:color).each do |color, livores|
      color_desc = LivorMortisDecorator.color_description(color)
      livores.group_by(&:on_finger_pressure).each do |finger, livores_|
        finger_desc = LivorMortis.translated_enum_value(:on_finger_pressure,
                                                        finger)
        pb << single_description_helper(livores_, color_desc, intensity_desc,
                                        finger_desc)
      end
    end
  end

  def single_description_helper(livores_mortis, color_desc, intensity_desc,
                                finger_desc)
    parts = body_parts(livores_mortis)
    parts_desc = t('.body_parts_description', body_parts: parts)
    first_part = t('.1st_part_description',
                   body_parts: parts_desc, color: color_desc,
                   intensity: intensity_desc)
    t('.single_description', '1st_part': first_part, finger: finger_desc)
  end
end
