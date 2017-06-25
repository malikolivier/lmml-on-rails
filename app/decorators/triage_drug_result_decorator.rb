class TriageDrugResultDecorator < ApplicationDecorator
  decorates_association :drug
  delegate :name, :description, to: :drug, prefix: true

  def drug_concentration_threshold
    drug.triage_concentration_threshold
  end
end
