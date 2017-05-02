# == Schema Information
#
# Table name: from_reference_reachable_organs
#
#  id                :integer          not null, primary key
#  body_reference_id :integer
#  organ_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class FromReferenceReachableOrgan < ApplicationRecord
  belongs_to :body_reference
  belongs_to :organ
end
