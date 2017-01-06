# == Schema Information
#
# Table name: examination_types
#
#  id          :integer          not null, primary key
#  category    :integer          not null
#  placement   :integer          not null
#  subdivision :integer
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ExaminationType < ApplicationRecord
  enum category: [:internal, :external]
  enum subdivision: [:head, :torso]
  has_many :organ_examinations
  has_many :organs, through: :organ_examinations
  has_many :examinations

  validates :name, uniqueness: { scope: :category }
  validates :placement, uniqueness: true

  def this_examination_model
    "#{category}_#{name}_examination".camelize.constantize
  end

  def self.by_name(name, category)
    find_by!(name: name, category: category)
  end
end
