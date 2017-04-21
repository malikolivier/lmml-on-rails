# == Schema Information
#
# Table name: injuries
#
#  id               :integer          not null, primary key
#  examination_id   :integer
#  description      :text
#  body_area_id     :integer
#  injury_size_id   :integer
#  injury_depth_id  :integer
#  injury_type      :integer
#  time_sustained   :integer
#  parent_injury_id :integer
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Injury < ApplicationRecord
  enum time_sustained: %i[pre_mortem post_mortem unknown]
  enum injury_type: %i[abrasion bruise laceration incision gun other]

  belongs_to :examination
  belongs_to :body_area
  belongs_to :injury_size
  belongs_to :injury_depth
  belongs_to :parent_injury, class_name: self

  has_many :injury_photograph_takings
  has_many :photographs, through: :injury_photograph_takings
  has_many :child_injuries, foreign_key: :parent_injury_id, class_name: self

  includes_in_json :photographs, :child_injuries,
                   body_area: BodyArea.as_lmml_params,
                   injury_size: InjurySize.as_lmml_params,
                   injury_depth: InjuryDepth.as_lmml_params

  delegate :expected_body_references, :reachable_organs, to: :examination
end
