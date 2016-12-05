# == Schema Information
#
# Table name: internal_abdominal_wall_examinations
#
#  id                         :integer          not null, primary key
#  examination_id             :integer
#  subcutaneous_fat_level     :integer
#  subcutaneous_fat_thickness :float
#  diaphragm_height_left      :float
#  diaphragm_height_right     :float
#  pleura_adhesion            :integer
#  air_in_digestive_track     :integer
#  peritoneum_adhesion        :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'lmml_on_rails/internal_torso_examination.rb'

class InternalAbdominalWallExamination < ApplicationRecord
  include LmmlOnRails::InternalTorsoExamination

  belongs_to :examination, required: true
  enum subcutaneous_fat_level: [:abundant, :normal, :insufficient],
       _prefix: 'fat'
  enum pleura_adhesion: Settings.enums.five_scale_quantity, _prefix: true
  enum peritoneum_adhesion: Settings.enums.five_scale_quantity, _prefix: true
  enum air_in_digestive_track: Settings.enums.five_scale_quantity, _prefix: true

  has_many :in_peritoneum_foreign_fluids
  has_many :foreign_fluids, through: :in_peritoneum_foreign_fluids

  validates :diaphragm_height_left, inclusion: 0..12
  validates :diaphragm_height_right, inclusion: 0..12
end
