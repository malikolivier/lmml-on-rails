# == Schema Information
#
# Table name: internal_heart_examinations
#
#  id                          :integer          not null, primary key
#  examination_id              :integer
#  weight                      :float
#  rigor_mortis                :integer
#  epicardial_lipomatosis      :integer
#  epicardial_petechia         :integer
#  extracted_blood_quantity    :float
#  extracted_blood_color       :integer
#  extracted_blood_coagulation :integer
#  thickness_left              :float
#  thickness_right             :float
#  pulmonary_artery_width      :float
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'lmml_on_rails/internal_torso_examination.rb'
class InternalHeartExamination < ApplicationRecord
  include LmmlOnRails::InternalTorsoExamination
  belongs_to :examination, required: true

  enum rigor_mortis: Settings.enums.existence, _prefix: true
  enum epicardial_lipomatosis: Settings.enums.existence, _prefix: true
  enum epicardial_petechia: Settings.enums.five_scale_quantity, _prefix: true
  # dark red: 暗赤色, florid: 鮮紅色
  enum extracted_blood_color: [:dark_red, :florid], _prefix: true
  enum extracted_blood_coagulation: Settings.enums.existence, _prefix: true

  has_many :coronary_arteries
  has_many :heart_chambers
end
