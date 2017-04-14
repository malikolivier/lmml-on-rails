class ExternalMouthExaminationDecorator < ApplicationDecorator
  decorates_association :foreign_fluids

  def description
    h.join_sentences(closedness_description,
                     foreign_fluid_description,
                     petechia_description,
                     tongue_tip_description)
  end

  private

  def closedness_description
    return '' if model.closed_other? || model.closed.blank?
    closedness_chunk = model.translated_enum_value(:closed)
    t('.closedness_description', aperture_chunk: aperture_chunk,
                                 closedness: closedness_chunk)
  end

  def aperture_chunk
    return '' unless model.closed_open? && model.aperture.present? &&
                     model.aperture.positive?
    t('.aperture_chunk', aperture: aperture)
  end

  def foreign_fluid_description
    if foreign_fluids.any?
      t('.has_foreign_fluids', fluids: foreign_fluids.description)
    else
      t('.no_foreign_fluid')
    end
  end

  def petechia_description
    return '' if model.petechia.blank?
    t('.petechia_description', quantity: model.translated_enum_value(:petechia))
  end

  def tongue_tip_description
    return '' if model.tongue_tip.blank?
    tongue_tip_chunk = model.translated_enum_value(:tongue_tip)
    t('.tongue_tip_description', tongue_tip: tongue_tip_chunk)
  end
end
