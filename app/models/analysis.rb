# == Schema Information
#
# Table name: analyses
#
#  id               :integer          not null, primary key
#  completed        :boolean
#  note             :text
#  autopsy_id       :integer          not null
#  analysis_type_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Analysis < ApplicationRecord
  belongs_to :autopsy, required: true
  belongs_to :analysis_type, required: true

  default_scope do
    # Order analyses
    joins(:analysis_type).order('`analysis_types`.`placement`')
  end

  def get
    analysis = analysis_type.this_analysis_model.find_by(analysis: self)
    analysis || analysis_type.this_analysis_model.new(analysis: self)
  end

  # Return a JSON-like hash representing the given analysis
  def serialize
    get.as_lmml_json.except!('analysis')
  end

  includes_in_json :analysis_type
  includes_method_in_json :serialize
end
