# == Schema Information
#
# Table name: analysis_types
#
#  id         :integer          not null, primary key
#  placement  :integer          not null
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AnalysisTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
