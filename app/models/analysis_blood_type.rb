# == Schema Information
#
# Table name: analysis_blood_types
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisBloodType < ApplicationRecord
  belongs_to :analysis, required: true
end
