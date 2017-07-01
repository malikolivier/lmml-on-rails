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
  translates :name

  enum unit: %i[% μmol/L]
end
