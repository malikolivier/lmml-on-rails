# == Schema Information
#
# Table name: coronary_arteries
#
#  id                            :integer          not null, primary key
#  internal_heart_examination_id :integer
#  category                      :integer          not null
#  stenosis                      :float
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class CoronaryArtery < ApplicationRecord
  belongs_to :internal_heart_examination, required: true

  enum category: [:LAD, :LCX, :RCA]

  # stenosis is the proportion of the artery which is obstructed by coagulated
  # blood in percent. 100% means the blood does not flow at all.
  validates :stenosis, inclusion: 0..100
  def blood_clot?
    stenosis == 100
  end

  def no_stenosis?
    stenosis == 0
  end
end
