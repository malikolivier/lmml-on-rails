class InternalAbdominalWallExaminationDecorator < ExaminationBaseDecorator
  decorates_association :pleura_foreign_fluids
  decorates_association :peritoneum_foreign_fluids

  def fat_description
    desc = PhraseBuilder.new(only_comma: true)
    desc << fat_level_chunk
    desc << fat_thickness_chunk
    desc.to_sentence
  end

  def thorax_no_injury_description
    return if any_injury?
    t('.thorax_no_injury')
  end

  def diaphragm_description
    return unless object.any_diaphragm_height?
    t('.diaphragm', description: diaphragm_height_description)
  end

  def pleura_adhesion_description
    return if object.pleura_adhesion.blank?
    t('.pleura_adhesion',
      intensity: object.translated_enum_value(:pleura_adhesion))
  end

  def pleura_foreign_fluids_description
    if object.pleura_foreign_fluids.any?
      t('.pleura_has_foreign_fluids',
        description: pleura_foreign_fluids.description)
    else
      t('.pleura_no_foreign_fluid')
    end
  end

  def air_in_digestive_track_description
    return if object.air_in_digestive_track.blank?
    t('.air_in_digestive_track',
      quantity: object.translated_enum_value(:air_in_digestive_track))
  end

  def peritoneum_adhesion_description
    return if object.peritoneum_adhesion.blank?
    t('.peritoneum_adhesion',
      intensity: object.translated_enum_value(:peritoneum_adhesion))
  end

  def peritoneum_foreign_fluids_description
    if object.peritoneum_foreign_fluids.any?
      t('.peritoneum_has_foreign_fluids',
        description: peritoneum_foreign_fluids.description)
    else
      t('.peritoneum_no_foreign_fluid')
    end
  end

  def peritoneum_no_injury_description
    return if any_injury?
    t('.peritoneum_no_injury')
  end

  private

  def fat_level_chunk
    return if object.subcutaneous_fat_level.blank?
    t('.fat_level',
      growth: object.translated_enum_value(:subcutaneous_fat_level))
  end

  def fat_thickness_chunk
    return if object.subcutaneous_fat_thickness.blank?
    t('.fat_thickness', thickness: object.subcutaneous_fat_thickness)
  end

  def diaphragm_height_description
    if object.same_diaphragm_height?
      t('.diaphragm_height_left_right',
        description: rib_position_sentence(:left))
    else
      desc = PhraseBuilder.new(only_comma: true)
      desc << diaphragm_height_left_description
      desc << diaphragm_height_right_description
      desc.to_sentence_no_dot
    end
  end

  def diaphragm_height_left_description
    return if object.diaphragm_height_left.blank?
    t('.diaphragm_height_left', description: rib_position_sentence(:left))
  end

  def diaphragm_height_right_description
    return if object.diaphragm_height_right.blank?
    t('.diaphragm_height_right', description: rib_position_sentence(:right))
  end

  def between_rib?(deixis)
    height = object.send("diaphragm_height_#{deixis}")
    height % 1 > 0.25 && height % 1 <= 0.75
  end

  def rib_position_sentence(deixis)
    height = object.send("diaphragm_height_#{deixis}")
    if between_rib?(deixis)
      t('.nth_intercostal_space', count: height.truncate)
    else
      t('.nth_rib', count: height.truncate)
    end
  end
end
