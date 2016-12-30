# == Schema Information
#
# Table name: analysis_uropapers
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  ph          :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisUropaper < ApplicationRecord
  belongs_to :analysis, required: true

  has_many :uropaper_results, -> { order(:category) }
end
