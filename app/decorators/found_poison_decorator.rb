class FoundPoisonDecorator < ApplicationDecorator
  decorates_association :drug
  delegate :description, to: :drug, prefix: true

  def concentration_description
    if object.qualitative?
      I18n.t "concentration.#{object.qualitative_concentration}"
    else
      "#{object.quantitative_concentration} #{object.unit}"
    end
  end
end
