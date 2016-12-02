# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :text
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Institution < ApplicationRecord
end
