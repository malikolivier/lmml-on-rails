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

  def get
    analysis_type.this_analysis_model.find_by!(analysis: self)
  end

  has_one :analysis_other

  delegate :other?, to: :analysis_type

  includes_in_json :analysis_type, methods: :get
end
