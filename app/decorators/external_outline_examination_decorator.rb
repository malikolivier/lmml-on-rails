class ExternalOutlineExaminationDecorator < ExaminationDecorator
  def sex_description
    if !model.O? && model.sex.present?
      sex = t("sex.#{model.sex}")
      t('.body_sex', sex: sex)
    else
      t('.unknown_sex')
    end
  end

  def height_weight_description # rubocop:disable AbcSize
    pb = PhraseBuilder.new(only_comma: true)
    if model.height.present?
      desc = t('.height_description', label: height_label, height: model.height)
      pb << desc
    end
    if model.weight.present?
      desc = t('.weight_description', label: weight_label, weight: model.weight)
      pb << desc
    end
    pb.to_sentence
  end

  def constitution_description
    t('.constitution', constitution: model.translated_enum_value(:constitution))
  end

  def livores_mortis_description
    pb = PhraseBuilder.new(only_comma: true)
    model.livores_mortis.group_by(&:intensity).each do |intensity, livores|
      if intensity == 'absent'
        parts = livores.map do |livor|
          livor.translated_enum_value(:position)
        end.join('・')
        pb << t('.livor_mortis_part_absent_description', body_parts: parts)
        next
      end
      t_int = LivorMortis.translated_enum_value(:intensity, intensity) || ''
      int_desc = t('.livor_mortis_intensity_description', intensity: t_int)
      livores.group_by(&:color).each do |color, livores_|
        t_color = LivorMortis.translated_enum_value(:color, color) || ''
        color_desc = t('.livor_mortis_color_description', color: t_color)
        livores_.group_by(&:on_finger_pressure).each do |finger, livores__|
          parts = livores__.map do |livor|
            livor.translated_enum_value(:position)
          end.join('・')
          parts_desc = t('.livor_mortis_parts_description', body_parts: parts)
          first_part = t('.livor_mortis_1st_part_description',
                         body_parts: parts_desc, color: color_desc,
                         intensity: int_desc)
          finger_desc = LivorMortis.translated_enum_value(:on_finger_pressure,
                                                          finger) || ''
          pb << t('.livor_mortis_description', '1st_part': first_part,
                                               finger: finger_desc)
        end
      end
    end
    t('.livores_mortis_description', livores_mortis: pb.to_sentence_no_dot) +
      ' ' + PhraseBuilder.new(model.livor_mortis_note).to_sentence
  end

  private

  def height_label
    model.partial_body ? t('.partial_height') : t('.height')
  end

  def weight_label
    model.partial_body ? t('.partial_height') : t('.height')
  end
end
