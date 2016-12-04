# == Schema Information
#
# Table name: external_trunk_examinations
#
#  id                      :integer          not null, primary key
#  examination_id          :integer
#  abnominal_discoloration :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class ExternalTrunkExamination < ApplicationRecord
  belongs_to :examination, required: true
  enum abnominal_discoloration: [:no_discoloration, :discolored]
end
