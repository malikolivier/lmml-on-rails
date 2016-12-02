# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  autopsy_id :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ApplicationRecord
    belongs_to :person, required: true
    belongs_to :autopsy, required: true
    belongs_to :role
end
