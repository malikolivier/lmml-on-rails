# == Schema Information
#
# Table name: examinations
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
#  note                :text
#  autopsy_id          :integer          not null
#  examination_type_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Examination < ApplicationRecord
  belongs_to :autopsy, required: true
  belongs_to :examination_type, required: true

  has_many :injuries

  def get
    if unique_examination?
      examination = examination_type.this_examination_model
                                    .find_by(examination: self)
      examination ||
        examination_type.this_examination_model.new(examination: self)
    else
      examination_type.this_examination_model.where(examination: self)
    end
  end

  def unique_examination?
    examination_type.organs.count <= 1
  end

  includes_in_json examination_type: ExaminationType.json_includes,
                   injuries: Injury.json_includes,
                   methods: :get
end
