# == Schema Information
#
# Table name: internal_genitalia_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  length            :float
#  fundal_width      :float
#  cervical_width    :float
#  endometrium_color :integer
#  ovaries_presence  :integer
#  ovaries_distance  :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalGenitaliaExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum endometrium_color: [:pale], _prefix: true
  enum ovaries_presence: [:yes, :right_is_missing, :left_is_missing, :no],
       _prefix: true

  def description
    '子宮に位置や形の異常なし。子宮は長さ・ ㎝、幅底部で・ ㎝、頸部で・ ㎝。内膜は蒼白で異常なし。卵巣は左右共・　大で異常なし。'
  end
end
