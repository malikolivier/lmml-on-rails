# == Schema Information
#
# Table name: analysis_biochemistries
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisBiochemistry < ApplicationRecord
  belongs_to :analysis, required: true

  has_many :biochemical_analyses, lambda {
    joins(:biochemical_analysis_type)
    .order('`biochemical_analysis_types`.`placement`')
  }
end
