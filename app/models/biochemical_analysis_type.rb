# == Schema Information
#
# Table name: biochemical_analysis_types
#
#  id         :integer          not null, primary key
#  placement  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BiochemicalAnalysisType < ApplicationRecord
  translates :title, :experiment_description
end
