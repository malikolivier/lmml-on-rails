# == Schema Information
#
# Table name: analysis_diatom_tests
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  conclusion  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisDiatomTest < AnalysisBase
  enum conclusion: %i[contradiction no_contradiction impossible_to_conclude]

  has_many :diatom_counts, -> { order(:category) }

  def left_lung
    diatom_counts.left_lung.take
  end

  def right_lung
    diatom_counts.right_lung.take
  end

  def water
    diatom_counts.water.take
  end
end
