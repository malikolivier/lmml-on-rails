# == Schema Information
#
# Table name: substances
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Here, designates the kind of substance usually found within the air track
# or the digestive system.
class Substance < ApplicationRecord
  def nothing?
    name == 'Nothing'
  end
end
