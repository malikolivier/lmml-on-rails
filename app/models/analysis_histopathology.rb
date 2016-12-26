# == Schema Information
#
# Table name: analysis_histopathologies
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisHistopathology < ApplicationRecord
  belongs_to :analysis, required: true

  has_many :analysis_histopathology_on_organs
  has_many :organs, through: :analysis_histopathology_on_organs
end
