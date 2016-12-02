# == Schema Information
#
# Table name: examinations
#
#  id                  :integer          not null, primary key
#  note                :text
#  autopsy_id          :integer          not null
#  examination_type_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Examination < ApplicationRecord
  belongs_to :autopsy, required: true
  belongs_to :examination_type, required: true

  def get
    examination_type.get_this_examination_model.find_by!(autopsy: autopsy)
  end
end
