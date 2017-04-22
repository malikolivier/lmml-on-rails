# == Schema Information
#
# Table name: body_areas
#
#  id                     :integer          not null, primary key
#  body_reference_id      :integer          not null
#  in_body_orientation_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class BodyArea < ApplicationRecord
  belongs_to :body_reference
  belongs_to :in_body_orientation

  includes_in_json :body_reference, :in_body_orientation

  accepts_nested_attributes_for :in_body_orientation,
                                reject_if: :all_blank
end
