class ForeignFluidDecorator < ApplicationDecorator
  def description
    odor_description = model.translated_enum_value(:odor)
    color_description = model.translated_enum_value(:color)
    appearance = h.join_words(odor_description, color_description)
    if appearance.present?
      t('.description', appearance: appearance, name: name)
    else
      name
    end
  end

  private

  def name
    model.name.presence || t('.unknown_fluid')
  end
end
