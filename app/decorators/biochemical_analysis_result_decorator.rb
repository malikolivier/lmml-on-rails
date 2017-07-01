class BiochemicalAnalysisResultDecorator < ApplicationDecorator
  decorates_association :molecule
  delegate :name, to: :molecule, prefix: true

  def quantity_description
    about = object.approximate ? '約' : ''
    "#{about}#{object.quantity}#{object.unit}"
  end

  def standard_description
    return if molecule.standard_description.blank?
    "（正常値 #{molecule.standard_description}）"
  end
end
