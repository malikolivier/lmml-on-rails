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
end
