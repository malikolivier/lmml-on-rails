# == Schema Information
#
# Table name: internal_pericardium_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  congestion     :integer
#  petechia       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalPericardiumExamination < ExaminationBase
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum petechia: Settings.enums.five_scale_quantity, _prefix: true,
       i18n_key: :quantity
end
