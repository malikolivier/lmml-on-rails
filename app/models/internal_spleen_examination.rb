# == Schema Information
#
# Table name: internal_spleen_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  hardness       :integer
#  congestion     :integer
#  pulp_distinct  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalSpleenExamination < ExaminationBase
  enum hardness: Settings.enums.hardness, i18n_key: :hardness
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum pulp_distinct: %i[clear unclear unknown], _prefix: true,
       i18n_key: :clarity
end
