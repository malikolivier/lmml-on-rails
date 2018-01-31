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

class InternalHeartExamination < ExaminationBase
  enum rigor_mortis: Settings.enums.existence, _prefix: true,
       i18n_key: :existence
  enum epicardial_lipomatosis: Settings.enums.existence, _prefix: true,
       i18n_key: :existence
  enum epicardial_petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity
  # dark red: 暗赤色, florid: 鮮紅色
  enum extracted_blood_color: %i[dark_red florid], _prefix: true,
       i18n_key: :color
  enum extracted_blood_coagulation: Settings.enums.existence, _prefix: true,
       i18n_key: :existence

  has_many :coronary_arteries, -> { order(:category) },
           inverse_of: :internal_heart_examination
  has_many :heart_chambers, -> { order(:category) },
           inverse_of: :internal_heart_examination

  enum scar_left: Settings.enums.existence, _prefix: true,
       i18n_key: :existence
  enum scar_right: Settings.enums.existence, _prefix: true,
       i18n_key: :existence
  enum pulmonary_artery_thrombus: Settings.enums.existence, _prefix: true,
       i18n_key: :existence

  accepts_nested_attributes_for :coronary_arteries, :heart_chambers,
                                reject_if: :all_blank

  includes_in_json :coronary_arteries, :heart_chambers
end
