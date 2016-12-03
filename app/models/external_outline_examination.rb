# == Schema Information
#
# Table name: external_outline_examinations
#
#  id           :integer          not null, primary key
#  sex          :integer
#  height       :float
#  weight       :float
#  partial_body :boolean
#  constitution :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ExternalOutlineExamination < ApplicationRecord
  enum sex: [:M, :F, :O]

  has_many :livores_mortis
end
