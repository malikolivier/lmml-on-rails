# == Schema Information
#
# Table name: external_outline_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  sex                :integer
#  height             :float
#  weight             :float
#  partial_body       :boolean          default(FALSE)
#  constitution       :text
#  livor_mortis_note  :text
#  rigor_mortis_note  :text
#  rectal_temperature :float
#  room_temperature   :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ExternalOutlineExamination < ApplicationRecord
  enum sex: [:M, :F, :O]

  belongs_to :examination, required: true

  has_many :livores_mortis
  has_many :rigores_mortis
end
