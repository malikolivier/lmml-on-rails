# == Schema Information
#
# Table name: organs
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organ < ApplicationRecord
  has_many :organ_examinations
  has_many :examination_types, through: :organ_examinations
end
