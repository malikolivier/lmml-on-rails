class MoleculeDecorator < ApplicationDecorator
  delegate :name, :standard_quantity_min, :standard_quantity_max, :unit

  def standard_description # rubocop:disable CyclomaticComplexity, MethodLength
    mask = 0b0
    mask += standard_quantity_min.present? ? 1 : 0
    mask += standard_quantity_max.present? ? 2 : 0
    case mask
    when 0b00
      nil
    when 0b01
      "#{standard_quantity_min}#{unit} 以上"
    when 0b10
      "#{standard_quantity_max}#{unit} 以下"
    when 0b11
      "#{standard_quantity_min}〜#{standard_quantity_max}#{unit}"
    end
  end
end
