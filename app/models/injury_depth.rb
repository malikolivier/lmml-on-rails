# == Schema Information
#
# Table name: injury_depths
#
#  id               :integer          not null, primary key
#  depth            :float
#  reached_organ_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InjuryDepth < ApplicationRecord
  belongs_to :reached_organ, class_name: 'Organ'

  includes_in_json reached_organ:
                     { except: :subject_to_histopathology_analysis }
end
