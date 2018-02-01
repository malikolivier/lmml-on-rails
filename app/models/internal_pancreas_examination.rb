# == Schema Information
#
# Table name: internal_pancreas_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  hardness       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalPancreasExamination < ExaminationBase
  enum hardness: Settings.enums.hardness
end
