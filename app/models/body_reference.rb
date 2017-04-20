# == Schema Information
#
# Table name: body_references
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 身体の特徴点
class BodyReference < ApplicationRecord
  translates :name
end
