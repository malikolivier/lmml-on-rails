# == Schema Information
#
# Table name: substances
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Here, designates the kind of substance usually found within the air track
# or the digestive system.
class Substance < ApplicationRecord
  translates :name, :description

  def nothing?
    name == 'Nothing'
  end
end
