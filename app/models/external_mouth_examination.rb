# == Schema Information
#
# Table name: external_mouth_examinations
#
#  id                           :integer          not null, primary key
#  closed                       :integer
#  aperture                     :float
#  petechia                     :integer
#  tongue_tip                   :integer
#  tongue_tip_distance          :float
#  note                         :text
#  external_face_examination_id :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ExternalMouthExamination < ApplicationRecord
  belongs_to :external_face_examination, required: true
  enum closed: Settings.enums.closedness, _prefix: true
  enum petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity
  enum tongue_tip: %i[behind front unknown], _prefix: true

  has_many :in_mouth_foreign_fluids
  has_many :foreign_fluids, through: :in_mouth_foreign_fluids
  has_many :tooth_examinations, -> { order(:position, :rank) },
           inverse_of: :external_mouth_examination
  alias teeth tooth_examinations

  has_many :mouth_photograph_takings
  has_many :photographs, through: :mouth_photograph_takings

  accepts_nested_attributes_for :foreign_fluids, :tooth_examinations,
                                reject_if: :all_blank
end
