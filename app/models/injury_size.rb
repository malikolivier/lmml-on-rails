# == Schema Information
#
# Table name: injury_sizes
#
#  id                     :integer          not null, primary key
#  shape                  :integer
#  length                 :float
#  width                  :float
#  in_body_orientation_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class InjurySize < ApplicationRecord
  enum shape: %i(longitudinal round undefined)
  belongs_to :in_body_orientation

  includes_in_json :in_body_orientation
end
