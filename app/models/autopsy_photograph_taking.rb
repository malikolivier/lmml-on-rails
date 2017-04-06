# == Schema Information
#
# Table name: autopsy_photograph_takings
#
#  id            :integer          not null, primary key
#  category      :integer
#  autopsy_id    :integer
#  photograph_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AutopsyPhotographTaking < ApplicationRecord
  enum category: %i(front back face other)

  belongs_to :autopsy
  belongs_to :photograph

  includes_in_json :photograph
end
