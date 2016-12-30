# == Schema Information
#
# Table name: biochemical_analysis_results
#
#  id                      :integer          not null, primary key
#  biochemical_analysis_id :integer
#  molecule_id             :integer
#  quantity                :float
#  approximate             :boolean          default(FALSE)
#  unit                    :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class BiochemicalAnalysisResult < ApplicationRecord
  belongs_to :biochemical_analysis
  belongs_to :molecule

  enum unit: [:%, :'μmol/L']
end
