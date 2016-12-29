# == Schema Information
#
# Table name: triage_supported_drugs
#
#  id                      :integer          not null, primary key
#  drug_id                 :integer
#  concentration_threshold :float
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class TriageSupportedDrug < ApplicationRecord
  belongs_to :drug, required: true
  # concentration_threshold in ng/mL
end
