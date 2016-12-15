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
#  scar_left                   :integer
#  scar_right                  :integer
#  pulmonary_artery_width      :float
#  pulmonary_artery_thrombus   :integer
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

  has_many :coronary_arteries, -> { order(:category) }
  has_many :heart_chambers

  enum scar_left: Settings.enums.existence, _prefix: true
  enum scar_right: Settings.enums.existence, _prefix: true
  enum pulmonary_artery_thrombus: Settings.enums.existence, _prefix: true

  def arteries_description
    return '' if coronary_arteries.count.zero?
    phrases = []
    stenosis_count = 0
    coronary_arteries.each do |artery|
      phrases.push(artery.description)
      stenosis_count += 1 if artery.stenosis?
    end
    if stenosis_count.zero?
      phrases = []
      coronary_arteries.each do |artery|
        phrases.push(artery.name)
      end
      "#{phrases.to_sentence}に硬化性狭窄なし。"
    else
      description = "#{phrases.to_sentence(words_connector: '、',
                                           last_word_connector: '、')}" \
                    'の硬化性狭窄がある'
      if coronary_arteries.blood_clot.none?
        "#{description}が、血栓はない。"
      else
        # TODO: make something more descriptive,
        # though I do not really know what to say
        "#{description}。"
      end
    end
  end
end
