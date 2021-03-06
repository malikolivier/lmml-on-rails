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

class InternalAbdominalWallExamination < ExaminationBase
  enum subcutaneous_fat_level: Settings.enums.three_scale_growth,
       _prefix: 'fat', i18n_key: :growth
  enum pleura_adhesion: Settings.enums.five_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum peritoneum_adhesion: Settings.enums.five_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum air_in_digestive_track: Settings.enums.five_scale_mass_quantity,
       _prefix: true, i18n_key: :mass_quantity

  has_many :in_pleura_foreign_fluids
  has_many :pleura_foreign_fluids, through: :in_pleura_foreign_fluids,
                                   class_name: 'ForeignFluid',
                                   source: :foreign_fluid
  has_many :in_peritoneum_foreign_fluids
  has_many :peritoneum_foreign_fluids, through: :in_peritoneum_foreign_fluids,
                                       class_name: 'ForeignFluid',
                                       source: :foreign_fluid

  validates :diaphragm_height_left,
            inclusion: -1..12,
            if: proc { |model| model.diaphragm_height_left.present? }
  validates :diaphragm_height_right,
            inclusion: -1..12,
            if: proc { |model| model.diaphragm_height_right.present? }

  def any_diaphragm_height?
    diaphragm_height_right.present? || diaphragm_height_left.present?
  end

  def same_diaphragm_height?
    any_diaphragm_height? && diaphragm_height_left == diaphragm_height_right
  end

  accepts_nested_attributes_for :pleura_foreign_fluids,
                                :peritoneum_foreign_fluids,
                                reject_if: :all_blank

  includes_in_json :pleura_foreign_fluids, :peritoneum_foreign_fluids
end
