class InternalBrainExaminationDecorator < ExaminationBaseDecorator
  def weight_description
    return if object.weight.blank?
    t('.weight', weight: object.weight)
  end

  def pia_congestion_description
    return if object.pia_congestion.blank?
    t('.pia_congestion',
      intensity: object.translated_enum_value(:pia_congestion))
  end

  def arachnoid_no_injury_description
    return if any_injury?
    t('.no_injury_arachnoid')
  end

  def blood_spots_description
    return if object.blood_spots.blank?
    t('.blood_spots', quantity: object.translated_enum_value(:blood_spots))
  end

  def no_injury_remaining_description
    return if any_injury?
    t('.no_injury')
  end
end
