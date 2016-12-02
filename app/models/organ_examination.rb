# == Schema Information
#
# Table name: organ_examinations
#
#  id                  :integer          not null, primary key
#  organ_id            :integer
#  examination_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class OrganExamination < ApplicationRecord
  belongs_to :organ, required: true
  belongs_to :examination_type, required: true
end
