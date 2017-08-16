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
       _prefix: 'fat'
  enum pleura_adhesion: Settings.enums.five_scale_quantity, _prefix: true
  enum peritoneum_adhesion: Settings.enums.five_scale_quantity, _prefix: true
  enum air_in_digestive_track: Settings.enums.five_scale_quantity, _prefix: true

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

  def diaphragm_height_description
    if diaphragm_height_left.present? &&
       diaphragm_height_left == diaphragm_height_right
      "左右#{rib_position_sentence(:left)}"
    else
      phrases = []
      if diaphragm_height_left.present?
        phrases.push("左#{rib_position_sentence(:left)}")
      end
      if diaphragm_height_right.present?
        phrases.push("右#{rib_position_sentence(:right)}")
      end
      phrases.to_sentence two_words_connector: '、'
    end
  end

  private

  def between_rib?(deixis)
    height = send("diaphragm_height_#{deixis}")
    height % 1 > 0.25 && height % 1 <= 0.75
  end

  def rib_position_sentence(deixis)
    height = send("diaphragm_height_#{deixis}")
    "第#{height.truncate}#{between_rib?(deixis) ? '肋間' : '肋骨'}"
  end

  accepts_nested_attributes_for :pleura_foreign_fluids,
                                :peritoneum_foreign_fluids,
                                reject_if: :all_blank

  includes_in_json :pleura_foreign_fluids, :peritoneum_foreign_fluids
end
