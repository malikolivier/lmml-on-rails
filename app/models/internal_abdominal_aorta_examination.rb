# == Schema Information
#
# Table name: internal_abdominal_aorta_examinations
#
#  id               :integer          not null, primary key
#  examination_id   :integer
#  arteriosclerosis :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InternalAbdominalAortaExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum arteriosclerosis: Settings.enums.five_scale_intensity, _prefix: true
end
