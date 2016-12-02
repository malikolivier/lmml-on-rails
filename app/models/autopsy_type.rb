# == Schema Information
#
# Table name: autopsy_types
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  law        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AutopsyType < ApplicationRecord
end
