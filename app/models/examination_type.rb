# == Schema Information
#
# Table name: examination_types
#
#  id         :integer          not null, primary key
#  category   :integer          not null
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExaminationType < ApplicationRecord
  enum category: [:internal, :external]
  has_many :organ_examinations
  has_many :organs, through: :organ_examinations
end
