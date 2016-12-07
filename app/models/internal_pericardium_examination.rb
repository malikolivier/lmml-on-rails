# == Schema Information
#
# Table name: internal_pericardium_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  congestion     :integer
#  petechia       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'lmml_on_rails/internal_torso_examination.rb'
class InternalPericardiumExamination < ApplicationRecord
  include LmmlOnRails::InternalTorsoExamination
  belongs_to :examination, required: true

  enum congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum petechia: Settings.enums.five_scale_quantity, _prefix: true
end