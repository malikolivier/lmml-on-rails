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

class ExternalFaceExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum congestion: Settings.enums.existence, _prefix: true
  enum swelling: Settings.enums.three_scale_intensity, _prefix: true

  has_many :external_eye_examinations
  alias_method :eyes, :external_eye_examinations

  has_one :external_mouth_examination
  alias_method :mouth, :external_mouth_examination

end
