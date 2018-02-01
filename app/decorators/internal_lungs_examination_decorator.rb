class InternalLungsExaminationDecorator < DualExaminationBaseDecorator
  decorates_association :foreign_fluids

  def weight_description
    return if object.weight.blank?
    t('.weight', deixis: translated_deixis, weight: object.weight)
  end

  def air_content_description
    return if object.air_content.blank?
    t('.air_content', quantity: object.translated_enum_value(:air_content))
  end

  def air_content_description_with_deixis
    return if object.air_content.blank?
    t('.air_content_deixis',
      deixis: translated_deixis,
      quantity: object.translated_enum_value(:air_content))
  end

  def congestion_description
    return if object.congestion.blank?
    t('.congestion', intensity: object.translated_enum_value(:congestion))
  end

  def congestion_description_with_deixis
    return if object.congestion.blank?
    t('.congestion_deixis',
      deixis: translated_deixis,
      intensity: object.translated_enum_value(:congestion))
  end

  def foreign_fluids_description
    if foreign_fluids.any?
      t('.has_foreign_fluids', deixis: translated_deixis,
                               description: foreign_fluids.description)
    else
      t('.no_foreign_fluid_deixis', deixis: translated_deixis)
    end
  end
end
