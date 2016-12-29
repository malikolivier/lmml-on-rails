# == Schema Information
#
# Table name: found_poisons
#
#  id                         :integer          not null, primary key
#  analysis_poisoning_id      :integer
#  drug_id                    :integer
#  unit                       :integer
#  quantitative_concentration :float
#  qualitative_concentration  :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class FoundPoison < ApplicationRecord
  belongs_to :analysis_poisoning, required: true
  belongs_to :drug, required: true

  enum unit: Settings.enums.units
  enum qualitative_concentration: Settings.enums.concentration
end
