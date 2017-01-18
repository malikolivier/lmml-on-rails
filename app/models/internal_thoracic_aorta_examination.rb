# == Schema Information
#
# Table name: internal_thoracic_aorta_examinations
#
#  id               :integer          not null, primary key
#  examination_id   :integer
#  width            :float
#  arteriosclerosis :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InternalThoracicAortaExamination < ExaminationBase
  enum arteriosclerosis: Settings.enums.five_scale_intensity, _prefix: true
end
