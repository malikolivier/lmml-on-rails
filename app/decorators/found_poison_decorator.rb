class FoundPoisonDecorator < ApplicationDecorator
  decorates_association :drug
  delegate :description, to: :drug, prefix: true

  def concentration_description
    if object.qualitative?
      object.translated_enum_value(:qualitative_concentration)
    elsif object.quantitative_concentration.present?
      t('.concentration_description',
        concentration: object.quantitative_concentration,
        unit: object.unit)
    else
      t('.no_data')
    end
  end
end
