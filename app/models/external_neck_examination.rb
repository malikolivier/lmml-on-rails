# == Schema Information
#
# Table name: external_neck_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExternalNeckExamination < ApplicationRecord
  belongs_to :examination, required: true
end
