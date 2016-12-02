# == Schema Information
#
# Table name: drugs
#
#  id         :integer          not null, primary key
#  name       :text
#  abbr       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Drug < ApplicationRecord
end
