# == Schema Information
#
# Table name: tooth_examinations
#
#  id                            :integer          not null, primary key
#  external_mouth_examination_id :integer          not null
#  position                      :integer          not null
#  rank                          :integer          not null
#  condition                     :integer          default("normal")
#  note                          :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class ToothExamination < ApplicationRecord
  belongs_to :external_mouth_examination, required: true

  enum position: [:upper_left, :upper_right, :lower_left, :lower_right]
  # 死後抜歯、生前抜歯、治療痕あり
  enum condition: [:normal, :pulled_pre_mortem, :pulled_post_mortem, :was_treated]

  # Rank is usually between 1 and 8
  validates_inclusion_of :rank, in: 1..10
end
