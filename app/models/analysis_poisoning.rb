# == Schema Information
#
# Table name: analysis_poisonings
#
#  id                      :integer          not null, primary key
#  analysis_id             :integer
#  contract_institution_id :integer
#  date                    :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class AnalysisPoisoning < AnalysisBase
  belongs_to :contract_institution, class_name: 'Institution'

  has_many :found_poisons
  has_many :chemical_analysis_methods, through: :found_poisons

  accepts_nested_attributes_for :found_poisons, reject_if: :all_blank
end
