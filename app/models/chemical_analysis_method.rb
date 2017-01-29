# == Schema Information
#
# Table name: chemical_analysis_methods
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChemicalAnalysisMethod < ApplicationRecord
  translates :name
end
