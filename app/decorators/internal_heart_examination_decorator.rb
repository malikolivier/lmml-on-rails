class InternalHeartExaminationDecorator < ExaminationBaseDecorator
  decorates_association :coronary_arteries
  decorates_association :heart_chambers

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

  def heart_chambers_description
    if any_injury?
      t('.heart_chambers_injury', description: heart_chambers.description)
    else
      t('.heart_chambers_no_injury', description: heart_chambers.description)
    end
  end

  def muscles_description
    muscle_phrases = PhraseBuilder.new(only_comma: true)
    muscle_phrases << thickness_description
    muscle_phrases << scar_description
    return if muscle_phrases.empty?
    t('.muscles', description: muscle_phrases.to_sentence)
  end

  def pulmonary_artery_description
    if object.pulmonary_artery_width.present?
      pulmonary_artery_with_width_description
    elsif object.pulmonary_artery_thrombus.present?
      t('.pulmonary_artery_thrombus',
        width: object.translated_enum_value(:pulmonary_artery_thrombus))
    end
  end

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

  def thickness_description
    same_thickness = object.thickness_left == object.thickness_right
    if object.thickness_left.present? && same_thickness
      t('.thickness_left_right', thickness: object.thickness_left)
    else
      different_thickness_description
    end
  end

  def different_thickness_description
    phrases = PhraseBuilder.new(only_comma: true)
    if object.thickness_left.present?
      phrases << t('.thickness_left', thickness: object.thickness_left)
    end
    if object.thickness_right.present?
      phrases << t('.thickness_right', thickness: object.thickness_right)
    end
    description = phrases.to_sentence_no_dot
    t('.thickness', description: description) if description.present?
  end

  def scar_description
    if no_scar?
      t('.no_scar')
    elsif object.scar_left_exists? && object.scar_right_exists?
      t('.left_right_scars')
    elsif object.scar_left_exists?
      t('.left_scar')
    elsif object.scar_right_exists?
      t('.right_scar')
    end
  end

  def no_scar?
    object.scar_left_does_not_exist? && object.scar_right_does_not_exist?
  end

  def pulmonary_artery_with_width_description
    if object.pulmonary_artery_thrombus.present?
      t('.pulmonary_artery_width_thrombus',
        width: object.pulmonary_artery_width,
        thrombus: object.translated_enum_value(:pulmonary_artery_thrombus))
    else
      t('.pulmonary_artery_width', width: object.pulmonary_artery_width)
    end
  end
end
