class InternalNeckOrgansExaminationDecorator < ExaminationBaseDecorator
  def no_skin_injury_description
    return if any_injury?
    t('.no_skin_injury')
  end

  def lymph_level_description
    return if object.lymph_level.blank?
    t('.lymph_level', growth: object.translated_enum_value(:lymph_level))
  end

  def substance_in_oesophagus_description
    return if object.oesophagus_substance.blank?
    t('.oesophagus_substance',
      substance: object.translated_enum_value(:oesophagus_substance))
  end

  def no_injury_membrane_description
    return if any_injury?
    t('.no_injury_membrane')
  end

  def air_track_organs_substance_description
    list = h.join_words(reached_air_track_organs)
    return if list.blank?
    t('.air_track_organs_subtance',
      organs: list,
      substance: object.translated_enum_value(:larynx_substance))
  end

  def no_remaining_injury_description
    return if any_injury?
    t('.no_remaining_injury')
  end

  private

  def reached_air_track_organs
    reached_organs = []
    Settings.air_track_organs.each do |air_track_organ|
      substance = object.send("#{air_track_organ}_substance")
      break if substance.nil? || object.send("#{air_track_organ}_none?")
      reached_organs.push(t("organs.#{air_track_organ}"))
    end
    reached_organs
  end
end
