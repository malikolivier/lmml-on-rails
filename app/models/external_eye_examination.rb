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
  enum closed: Settings.enums.closedness, _prefix: 'eye'

  enum eyelid_congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum eyelid_petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity
  enum conjunctiva_congestion: Settings.enums.three_scale_intensity,
       _prefix: true, i18n_key: :intensity
  enum conjunctiva_petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity

  belongs_to :external_face_examination, required: true

  validates :deixis, presence: true
end
