# == Schema Information
#
# Table name: internal_thoracic_aorta_examinations
#
#  id               :integer          not null, primary key
#  examination_id   :integer
#  width            :float
#  arteriosclerosis :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'lmml_on_rails/internal_torso_examination.rb'
class InternalThoracicAortaExamination < ApplicationRecord
  include LmmlOnRails::InternalTorsoExamination
  belongs_to :examination, required: true

  enum arteriosclerosis: Settings.enums.five_scale_intensity
end
