# == Schema Information
#
# Table name: organ_body_references
#
#  id                :integer          not null, primary key
#  organ_id          :integer
#  body_reference_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class OrganBodyReference < ApplicationRecord
  belongs_to :organ
  belongs_to :body_reference
end
