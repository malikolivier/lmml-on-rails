# == Schema Information
#
# Table name: analysis_histopathologies
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisHistopathology < AnalysisBase
  has_many :analysis_histopathology_on_organs,
           inverse_of: :analysis_histopathology
  has_many :organs, through: :analysis_histopathology_on_organs

  accepts_nested_attributes_for :analysis_histopathology_on_organs,
                                reject_if: :all_blank
end
