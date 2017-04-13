# == Schema Information
#
# Table name: external_face_examinations
#
#  id                   :integer          not null, primary key
#  examination_id       :integer
#  congestion           :integer
#  swelling             :integer
#  nasal_cavity_content :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ExternalFaceExamination < ExaminationBase
  enum congestion: Settings.enums.existence, _prefix: true, i18n_key: :existence
  enum swelling: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity

  has_many :external_eye_examinations, -> { order(:deixis) },
           inverse_of: :external_face_examination

  alias eyes external_eye_examinations

  has_one :external_mouth_examination, inverse_of: :external_face_examination
  alias mouth external_mouth_examination

  accepts_nested_attributes_for :external_eye_examinations,
                                reject_if: :all_blank
  accepts_nested_attributes_for :external_mouth_examination,
                                update_only: true

  includes_in_json :external_eye_examinations,
                   external_mouth_examination: {
                     include: :tooth_examinations
                   }
end
