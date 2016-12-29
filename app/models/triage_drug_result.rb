# == Schema Information
#
# Table name: triage_drug_results
#
#  id                 :integer          not null, primary key
#  analysis_triage_id :integer
#  drug_id            :integer
#  result             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class TriageDrugResult < ApplicationRecord
  belongs_to :analysis_triage, required: true
  belongs_to :drug, required: true

  enum result: Settings.enums.tests.binary_result

  scope :not_positive, -> { where.not(result: :positive) }
end
