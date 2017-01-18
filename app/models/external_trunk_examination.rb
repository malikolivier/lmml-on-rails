# == Schema Information
#
# Table name: external_trunk_examinations
#
#  id                      :integer          not null, primary key
#  examination_id          :integer
#  abdominal_discoloration :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class ExternalTrunkExamination < ExaminationBase
  enum abdominal_discoloration: [:no_discoloration, :discolored]
end
