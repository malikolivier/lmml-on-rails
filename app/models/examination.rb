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
    examination_type.this_examination_model.find_by!(examination: self)
  end

  validates :examination_type, presence: true

  scope :external, lambda {
    joins(:examination_type).where(examination_types:
      { category: ExaminationType.categories[:external] })
  }
  scope :standard_order, lambda {
    order('`examination_types`.`placement` ASC')
  }
end
