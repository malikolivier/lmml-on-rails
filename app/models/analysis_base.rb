class AnalysisBase < ApplicationRecord
  self.abstract_class = true

  belongs_to :analysis, required: true

  accepts_nested_attributes_for :analysis, update_only: true

  includes_in_json :analysis
end
