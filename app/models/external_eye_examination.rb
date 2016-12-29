# == Schema Information
#
# Table name: external_eye_examinations
#
#  id                           :integer          not null, primary key
#  external_face_examination_id :integer          not null
#  deixis                       :integer          not null
#  closed                       :integer
#  aperture                     :float
#  eyelid_congestion            :integer
#  eyelid_petechia              :integer
#  eyelid_note                  :text
#  conjunctiva_congestion       :integer
#  conjunctiva_petechia         :integer
#  conjunctiva_note             :text
#  cornea                       :text
#  pupil                        :text
#  diameter                     :float
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ExternalEyeExamination < ApplicationRecord
  enum deixis: Settings.enums.deixes
  enum closed: Settings.enums.closedness

  enum eyelid_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum eyelid_petechia: Settings.enums.five_scale_quantity, _prefix: true
  enum conjunctiva_congestion: Settings.enums.three_scale_intensity,
       _prefix: true
  enum conjunctiva_petechia: Settings.enums.five_scale_quantity, _prefix: true

  belongs_to :external_face_examination, required: true

  validates :deixis, presence: true

  def closedness_report
    if !other?
      aperture_sentence = open? && aperture.positive? ? "#{aperture}cm" : ''
      closedness = I18n.t "closedness.#{closed}"
      sentence = "#{I18n.t deixis}眼は#{aperture_sentence}#{closedness}。"
    else
      sentence = ''
    end
    sentence
  end
end
