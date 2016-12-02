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
#  injury_type_id   :integer
#  time_sustained   :integer
#  parent_injury_id :integer
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Injury < ApplicationRecord
  enum time_sustained: [:pre_mortem, :post_mortem, :unknown]
  belongs_to :examination, required: true
  belongs_to :body_area
end
