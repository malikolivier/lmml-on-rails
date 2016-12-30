# == Schema Information
#
# Table name: uropaper_results
#
#  id                   :integer          not null, primary key
#  analysis_uropaper_id :integer
#  category             :integer          not null
#  result               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class UropaperResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
