# == Schema Information
#
# Table name: internal_lungs_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  deixis         :integer          not null
#  weight         :float
#  air_content    :integer
#  congestion     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalLungsExamination < DualExaminationBase
  enum air_content: Settings.enums.five_scale_mass_quantity, _prefix: true
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true

  has_many :in_lung_foreign_fluids
  has_many :foreign_fluids, through: :in_lung_foreign_fluids

  accepts_nested_attributes_for :foreign_fluids, reject_if: :all_blank
end
