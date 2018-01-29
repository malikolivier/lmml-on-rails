# == Schema Information
#
# Table name: internal_neck_organs_examinations
#
#  id                              :integer          not null, primary key
#  examination_id                  :integer
#  lymph_level                     :integer
#  oesophagus_substance            :integer
#  oesophagus_substance_quantity   :integer
#  larynx_substance                :integer
#  larynx_substance_quantity       :integer
#  trachea_substance               :integer
#  trachea_substance_quantity      :integer
#  main_bronchi_substance          :integer
#  main_bronchi_substance_quantity :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class InternalNeckOrgansExamination < ExaminationBase
  enum lymph_level: Settings.enums.three_scale_growth, _prefix: 'lymph',
       i18n_key: :growth

  enum oesophagus_substance: Settings.enums.substance, _prefix: 'oesophagus',
       i18n_key: :substance
  enum oesophagus_substance_quantity: Settings.enums.five_scale_quantity,
       _prefix: true, i18n_key: :quantity
  # Usually, subtances go from top to bottom, so if something is in the bronchi,
  # it is as well inside the trachea and the larynx.
  Settings.air_track_organs.each do |air_track_organ|
    enum "#{air_track_organ}_substance".to_sym => Settings.enums.substance,
         _prefix: air_track_organ, i18n_key: :substance
    enum "#{air_track_organ}_substance_quantity".to_sym =>
            Settings.enums.five_scale_quantity,
         _prefix: true, i18n_key: :quantity
  end
end
