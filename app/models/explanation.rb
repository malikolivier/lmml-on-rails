# == Schema Information
#
# Table name: explanations
#
#  id         :integer          not null, primary key
#  title      :text
#  content    :text
#  autopsy_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Explanation < ApplicationRecord
  belongs_to :autopsy
end
