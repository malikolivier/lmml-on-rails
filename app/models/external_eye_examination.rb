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
#  eyelid_petechia_count        :integer
#  eyelid_note                  :text
#  conjunctiva_congestion       :integer
#  conjunctiva_petechia_count   :integer
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
  enum conjunctiva_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum conjunctiva_petechia: Settings.enums.five_scale_quantity, _prefix: true

  belongs_to :external_face_examination, required: true
end
