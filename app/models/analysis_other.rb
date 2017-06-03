# == Schema Information
#
# Table name: analysis_others
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  title       :text
#  content     :text
#  placement   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisOther < AnalysisBase
end
