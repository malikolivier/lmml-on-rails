# == Schema Information
#
# Table name: analyses
#
#  id               :integer          not null, primary key
#  completed        :boolean
#  note             :text
#  autopsy_id       :integer          not null
#  analysis_type_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class AnalysisTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
