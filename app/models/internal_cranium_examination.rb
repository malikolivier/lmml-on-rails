# == Schema Information
#
# Table name: internal_cranium_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'lmml_on_rails/internal_head_examination.rb'

class InternalCraniumExamination < ApplicationRecord
  include LmmlOnRails::InternalHeadExamination

  belongs_to :examination, required: true
end
