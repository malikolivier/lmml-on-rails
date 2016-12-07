# == Schema Information
#
# Table name: internal_neck_organs_examinations
#
#  id                        :integer          not null, primary key
#  examination_id            :integer
#  lymph_level               :integer
#  oesophagus_substance_id   :integer
#  larynx_substance_id       :integer
#  trachea_substance_id      :integer
#  main_bronchi_substance_id :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'lmml_on_rails/internal_torso_examination.rb'
class InternalNeckOrgansExamination < ApplicationRecord
  include LmmlOnRails::InternalTorsoExamination

  belongs_to :examination, required: true
  enum lymph_level: Settings.enums.three_scale_growth, _prefix: 'lymph'

  belongs_to :oesophagus_substance, class_name: Substance
  # Usually, subtances go from top to bottom, so if something is in the bronchi,
  # it is as well inside the trachea and the larynx.
  for air_track_organ in Settings.air_track_organs
    belongs_to "#{air_track_organ}_substance".to_sym, class_name: Substance
  end

  def air_track_organs_description
    organ_names = []
    reached_air_track_organs.each do |organ|
      organ_names.push(I18n.t "organs.#{organ}")
    end
    organ_names.join('・')
  end

  private

  def reached_air_track_organs
    reached_organs = []
    for air_track_organ in Settings.air_track_organs
      subtance = send("#{air_track_organ}_substance")
      if subtance.nothing?
        break
      end
      reached_organs.push(air_track_organ)
    end
    reached_organs
  end
end
