# == Schema Information
#
# Table name: analysis_histopathology_on_organs
#
#  id                         :integer          not null, primary key
#  organ_id                   :integer
#  analysis_histopathology_id :integer          not null
#  result                     :text
#  other_organ                :text
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class AnalysisHistopathologyOnOrgan < ApplicationRecord
  belongs_to :organ
  belongs_to :analysis_histopathology, required: true

  validate :organ?

  def retrieve_organ
    organ || other_organ
  end

  private

  def organ?
    return if retrieve_organ.present?
    errors.add(:organ_missing,
               "At least one of 'organ' or 'other_organ' must be filled")
  end
end
