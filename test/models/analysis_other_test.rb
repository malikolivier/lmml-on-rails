# == Schema Information
#
# Table name: analysis_others
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  title       :text
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AnalysisOtherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
