# == Schema Information
#
# Table name: organs
#
#  id                                 :integer          not null, primary key
#  subject_to_histopathology_analysis :boolean          default(FALSE)
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class Organ < ApplicationRecord
  has_many :organ_examinations
  has_many :examination_types, through: :organ_examinations

  scope :subject_to_histopathology_analysis,
        -> { where(subject_to_histopathology_analysis: true) }
end
