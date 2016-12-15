# == Schema Information
#
# Table name: heart_chambers
#
#  id                            :integer          not null, primary key
#  internal_heart_examination_id :integer
#  category                      :integer          not null
#  size                          :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class HeartChamber < ApplicationRecord
  belongs_to :internal_heart_examination, required: true

  enum category: [:left_ventricle, :right_ventricle,
                  :left_atrium, :right_atrium]
  enum size: [:usual, :big, :small], _prefix: true
end
