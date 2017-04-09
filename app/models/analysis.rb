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
    analyses = arel_table
    select('`analyses`.*, `analysis_types`.`placement`, `analysis_others`.`placement`').from(
      analyses.create_table_alias(
        built_in_analyses.union(other_analyses),
        table_name
      )
    ).order('`analysis_types`.`placement`, `analysis_others`.`placement`')
  end
  scope :built_in_analyses, -> {
    select("`analyses`.*, `analysis_types`.`placement`, 0 AS '`analysis_others`.`placement`'")
      .joins(:analysis_type).where.not(analysis_types: { name: 'other'})
  }
  scope :other_analyses, -> {
    select('`analyses`.*, `analysis_types`.`placement`, `analysis_others`.`placement`')
      .joins(:analysis_type)
      .joins(:analysis_other)
      .where(analysis_types: { name: 'other'})
  }

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
