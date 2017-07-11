class MoleculeDecorator < ApplicationDecorator
  delegate :name, :standard_quantity_min, :standard_quantity_max, :unit

  # rubocop:disable CyclomaticComplexity, MethodLength, AbcSize
  def standard_description
    mask = 0b0
    mask += standard_quantity_min.present? ? 1 : 0
    mask += standard_quantity_max.present? ? 2 : 0
    case mask
    when 0b00
      nil
    when 0b01
      t('.more_than', min: standard_quantity_min, unit: unit)
    when 0b10
      t('.less_than', max: standard_quantity_max, unit: unit)
    when 0b11
      t('.interval', min: standard_quantity_min, max: standard_quantity_max,
                     unit: unit)
    end
  end
end
