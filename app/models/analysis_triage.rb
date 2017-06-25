# == Schema Information
#
# Table name: analysis_triages
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisTriage < AnalysisBase
  has_many :triage_drug_results
  has_many :drugs, through: :triage_drug_results

  accepts_nested_attributes_for :triage_drug_results, reject_if: :all_blank
end
