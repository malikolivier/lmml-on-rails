# == Schema Information
#
# Table name: analysis_instant_views
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisInstantView < AnalysisBase
  has_many :instant_view_drug_results
  has_many :drugs, through: :instant_view_drug_results
end
