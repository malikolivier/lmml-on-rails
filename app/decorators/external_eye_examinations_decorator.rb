class ExternalEyeExaminationsDecorator < DualRecordsDecorator
  def closedness_description
    if attribute_equal?(:closed)
      same_closedness_descripton
    else
      h.join_sentences([left.try(:closedness_description),
                        right.try(:closedness_description)])
    end
  end

  def left_eye_details
    left.details if left.present?
  end

  def right_eye_details
    right.details if right.present?
  end

  def dimensions_description
    h.join_sentences(cornea_description,
                     pupil_description,
                     diameter_description)
  end

  private

  def same_closedness_descripton
    if all_eyes_identical?
      t('.all_eyes_identical', aperture_chunk: left.aperture_chunk,
                               closedness: left.closedness_chunk)
    else
      t('.different_apertures', left_aperture: left.aperture,
                                right_aperture: right.aperture)
    end
  end

  def all_eyes_identical?
    left.eye_closed? || (left.eye_open? && attribute_equal?(:aperture))
  end

  def cornea_description
    if attribute_equal_and_present?(:cornea)
      t('.corneas_description', cornea: left.object.cornea)
    else
      pb = PhraseBuilder.new(left.try(:cornea_description),
                             right.try(:cornea_description), only_comma: true)
      pb.to_sentence
    end
  end

  def pupil_description
    if attribute_equal_and_present?(:pupil)
      t('.pupils_description', pupil: left.object.pupil)
    else
      pb = PhraseBuilder.new(left.try(:pupil_description),
                             right.try(:pupil_description), only_comma: true)
      pb.to_sentence
    end
  end

  def diameter_description
    if attribute_equal_and_present?(:diameter)
      t('.diameters_description', diameter: left.object.diameter)
    else
      pb = PhraseBuilder.new(left.try(:diameter_description),
                             right.try(:diameter_description), only_comma: true)
      pb.to_sentence
    end
  end
end
