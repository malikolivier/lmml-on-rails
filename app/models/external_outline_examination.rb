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

class ExternalOutlineExamination < ExaminationBase
  enum sex: Settings.enums.sex

  has_many :livores_mortis, inverse_of: :external_outline_examination
  has_many :rigores_mortis, inverse_of: :external_outline_examination

  accepts_nested_attributes_for :livores_mortis, :rigores_mortis,
                                reject_if: :all_blank
end
