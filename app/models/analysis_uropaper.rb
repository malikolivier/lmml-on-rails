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

class AnalysisUropaper < AnalysisBase
  has_many :uropaper_results, -> { order(:category) }

  accepts_nested_attributes_for :uropaper_results, reject_if: :all_blank

  includes_in_json :uropaper_results
end
