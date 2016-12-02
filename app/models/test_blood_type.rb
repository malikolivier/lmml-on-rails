# == Schema Information
#
# Table name: test_blood_types
#
#  id         :integer          not null, primary key
#  result     :text
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TestBloodType < ApplicationRecord
end
