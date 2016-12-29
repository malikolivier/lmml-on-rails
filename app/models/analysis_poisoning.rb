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

class AnalysisPoisoning < ApplicationRecord
  belongs_to :analysis, required: true
  belongs_to :contract_institution, class_name: Institution

  has_many :found_poisons
end
