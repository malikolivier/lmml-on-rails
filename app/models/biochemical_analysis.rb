# == Schema Information
#
# Table name: biochemical_analyses
#
#  id                           :integer          not null, primary key
#  analysis_biochemistry_id     :integer
#  contract_institution_id      :integer
#  biochemical_analysis_type_id :integer
#  date                         :date
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BiochemicalAnalysis < ApplicationRecord
  belongs_to :analysis_biochemistry, required: true
  belongs_to :contract_institution, class_name: 'Institution'
  belongs_to :biochemical_analysis_type, required: true

  has_many :biochemical_analysis_results
end
