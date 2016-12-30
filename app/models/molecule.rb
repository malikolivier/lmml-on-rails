# == Schema Information
#
# Table name: molecules
#
#  id                    :integer          not null, primary key
#  standard_quantity_min :float
#  standard_quantity_max :float
#  unit                  :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Molecule < ApplicationRecord
  enum unit: [:%, :'μmol/L']

  has_many :molecule_translations

  def translation
    molecule_translations.language(I18n.locale).take!
  end

  def standard_description
    mask = 0b0
    mask += standard_quantity_min.present? && !standard_quantity_min.zero? ? 1 : 0
    mask += standard_quantity_max.present? ? 1 : 0
    case mask
    when 0b00
      nil
    when 0b01
      "#{standard_quantity_max}#{unit} 以上"
    when 0b10
      "#{standard_quantity_min}#{unit} 以下"
    when 0b11
      "#{standard_quantity_min}〜#{standard_quantity_max}#{unit}"
    end
  end
end
