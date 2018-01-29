# == Schema Information
#
# Table name: internal_neck_organs_examinations
#
#  id                              :integer          not null, primary key
#  examination_id                  :integer
#  lymph_level                     :integer
#  oesophagus_substance_id         :integer
#  oesophagus_substance_quantity   :integer
#  larynx_substance_id             :integer
#  larynx_substance_quantity       :integer
#  trachea_substance_id            :integer
#  trachea_substance_quantity      :integer
#  main_bronchi_substance_id       :integer
#  main_bronchi_substance_quantity :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class InternalNeckOrgansExamination < ExaminationBase
  enum lymph_level: Settings.enums.three_scale_growth, _prefix: 'lymph',
       i18n_key: :growth

  belongs_to :oesophagus_substance, class_name: 'Substance'
  enum oesophagus_substance_quantity: Settings.enums.five_scale_quantity,
       _prefix: true, i18n_key: :quantity
  # Usually, subtances go from top to bottom, so if something is in the bronchi,
  # it is as well inside the trachea and the larynx.
  Settings.air_track_organs.each do |air_track_organ|
    belongs_to "#{air_track_organ}_substance".to_sym, class_name: 'Substance'
    enum "#{air_track_organ}_substance_quantity".to_sym =>
            Settings.enums.five_scale_quantity,
         _prefix: true, i18n_key: :quantity
  end

  def air_track_organs_description
    organ_names = []
    reached_air_track_organs.each do |organ|
      organ_names.push(I18n.t("organs.#{organ}"))
    end
    organ_names.join('・')
  end

  private

  def reached_air_track_organs
    reached_organs = []
    Settings.air_track_organs.each do |air_track_organ|
      substance = send("#{air_track_organ}_substance")
      break if substance.nil? || substance.nothing?
      reached_organs.push(air_track_organ)
    end
    reached_organs
  end
end
