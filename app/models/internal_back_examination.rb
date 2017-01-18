# == Schema Information
#
# Table name: internal_back_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalBackExamination < ExaminationBase
end
