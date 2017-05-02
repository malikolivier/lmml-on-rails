# == Schema Information
#
# Table name: body_references
#
#  id         :integer          not null, primary key
#  position   :integer
#  deixis     :integer
#  abbr       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 身体の特徴点
class BodyReference < ApplicationRecord
  default_scope -> { order(:position, :deixis) }

  enum deixis: Settings.enums.deixes

  translates :name, :description

  has_many :from_reference_reachable_organs
  has_many :reachable_organs, through: :from_reference_reachable_organs,
                              source: :organ
end
