# == Schema Information
#
# Table name: institutions
#
#  id                  :integer          not null, primary key
#  name                :text
#  address             :text
#  institution_type_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Institution < ApplicationRecord
  belongs_to :institution_type
end
