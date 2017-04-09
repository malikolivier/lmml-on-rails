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
    # Order analyses by type
    joins(:analysis_type).left_outer_joins(:analysis_other)
      .order('`analysis_types`.`placement`, `analysis_others`.`placement`')
  end

  def get
    analysis_type.this_analysis_model.find_by!(analysis: self)
  end

  # Return a JSON-like hash representing the given analysis
  def serialize
    get.as_lmml_json.except!('analysis')
  end

  has_one :analysis_other

  delegate :other?, to: :analysis_type

  includes_in_json :analysis_type
  includes_method_in_json :serialize
end
