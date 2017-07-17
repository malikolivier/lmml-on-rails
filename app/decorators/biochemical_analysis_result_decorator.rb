class BiochemicalAnalysisResultDecorator < ApplicationDecorator
  decorates_association :molecule
  delegate :name, to: :molecule, prefix: true, allow_nil: true

  def quantity_description
    if object.approximate
      t('.approximate_quantity', quantity: object.quantity, unit: object.unit)
    else
      t('.exact_quantity', quantity: object.quantity, unit: object.unit)
    end
  end

  def standard_description
    return if molecule.blank? || molecule.standard_description.blank?
    t('.standard', standard: molecule.standard_description)
  end
end
