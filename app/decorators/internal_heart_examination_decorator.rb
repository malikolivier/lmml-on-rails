class InternalHeartExaminationDecorator < ExaminationBaseDecorator
  decorates_association :coronary_arteries

  def weight_description
    return if object.weight.blank?
    t('.weight', weight: object.weight)
  end

  def rigor_mortis_description
    return if object.rigor_mortis.blank?
    t('.rigor_mortis', existence: object.translated_enum_value(:rigor_mortis))
  end

  def epicardial_lipomatosis_description
    return if object.epicardial_lipomatosis.blank?
    t('.epicardial_lipomatosis',
      existence: object.translated_enum_value(:epicardial_lipomatosis))
  end

  def epicardial_petechia_description
    return if object.epicardial_petechia.blank?
    t('.epicardial_petechia',
      quantity: object.translated_enum_value(:epicardial_petechia))
  end

  def extracted_blood_description
    props = extracted_blood_props
    return if props.blank?
    _extracted_blood_description(props)
  end

  delegate :description, to: :coronary_arteries, prefix: true

  private

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def extracted_blood_props
    props = []
    if object.extracted_blood_quantity.present?
      props << t('.extracted_blood_quantity',
                 quantity: object.extracted_blood_quantity)
    end
    if object.extracted_blood_color.present?
      props << t('.extracted_blood_color',
                 color: object.translated_enum_value(:extracted_blood_color))
    end
    if object.extracted_blood_coagulation.present?
      existence = object.translated_enum_value(:extracted_blood_coagulation)
      props << t('.extracted_blood_coagulation', existence: existence)
    end
    props
  end

  def _extracted_blood_description(props)
    case props.length
    when 1
      t('.extracted_blood', chunk: props[0])
    when 2
      chunk = t('.extracted_blood_2props', prop1: props[0], prop2: props[1])
      t('.extracted_blood', chunk: chunk)
    when 3
      chunk = t('.extracted_blood_3props', prop1: props[0], prop2: props[1],
                                           prop3: props[2])
      t('.extracted_blood', chunk: chunk)
    end
  end
end
