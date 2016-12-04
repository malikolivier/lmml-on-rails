# == Schema Information
#
# Table name: external_back_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExternalBackExamination < ApplicationRecord
  belongs_to :examination, required: true
end
