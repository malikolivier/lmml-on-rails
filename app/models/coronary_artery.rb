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

  enum category: %i(LAD LCX RCA)

  # stenosis is the proportion of the artery which is obstructed by coagulated
  # blood in percent. 100% means the blood does not flow at all.
  validates :stenosis, inclusion: 0..100
  scope :blood_clot, -> { where(stenosis: 100) }
  scope :no_stenosis, -> { where(stenosis: 0) }
  def stenosis?
    stenosis.positive?
  end

  def description
    "#{name}に#{stenosis}%"
  end

  def name
    I18n.t "organs.#{category}"
  end
end
