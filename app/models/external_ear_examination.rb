# == Schema Information
#
# Table name: external_ear_examinations
#
#  id                           :integer          not null, primary key
#  deixis                       :integer          not null
#  bleeding                     :boolean          default(FALSE)
#  injury_id                    :integer
#  external_head_examination_id :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ExternalEarExamination < ApplicationRecord
  enum deixis: [:left, :right]

  belongs_to :injury
  belongs_to :external_head_examination, required: true

  validates :external_head_examination, presence: true
end
