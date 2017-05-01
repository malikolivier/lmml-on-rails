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
end
