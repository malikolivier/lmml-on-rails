# == Schema Information
#
# Table name: analysis_others
#
#  id         :integer          not null, primary key
#  autopsy_id :integer
#  title      :text
#  content    :text
#  placement  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnalysisOther < ApplicationRecord
  default_scope { order(:placement) }

  belongs_to :autopsy, required: true
end
