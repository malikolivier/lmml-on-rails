# == Schema Information
#
# Table name: external_mouth_examinations
#
#  id                           :integer          not null, primary key
#  closed                       :integer
#  aperture                     :float
#  petechia                     :integer
#  tongue_tip                   :integer
#  note                         :text
#  external_face_examination_id :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ExternalMouthExamination < ApplicationRecord
  belongs_to :external_face_examination, required: true
  enum closed: Settings.enums.closedness
  enum petechia: Settings.enums.five_scale_quantity, _prefix: true
  enum tongue_tip: [:behind, :front, :unknown], _prefix: true

  has_many :in_mouth_foreign_fluids
  has_many :foreign_fluids, through: :in_mouth_foreign_fluids
  has_many :tooth_examinations
  alias_method :teeth, :tooth_examinations

  has_many :mouth_photograph_takings
  has_many :photographs, through: :mouth_photograph_takings

  # TODO: 舌尖 tongue_tip, what should be written there?

  def closedness_report
    if !other?
      aperture_sentence = open? && aperture.positive? ? "#{aperture}cm" : ''
      closedness = I18n.t "closedness.#{closed}"
      sentence = "口は#{aperture_sentence}#{closedness}。"
    else
      sentence = ''
    end
    sentence
  end

  accepts_nested_attributes_for :foreign_fluids, :tooth_examinations,
                                reject_if: :all_blank
end
