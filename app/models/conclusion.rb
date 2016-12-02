# == Schema Information
#
# Table name: conclusions
#
#  id         :integer          not null, primary key
#  content    :text
#  autopsy_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conclusion < ApplicationRecord
  belongs_to :autopsy, required: true
end
