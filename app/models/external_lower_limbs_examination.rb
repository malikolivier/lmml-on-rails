# == Schema Information
#
# Table name: external_lower_limbs_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExternalLowerLimbsExamination < ExaminationBase
end
