# == Schema Information
#
# Table name: conclusions
#
#  id         :integer          not null, primary key
#  content    :text
#  autopsy_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ConclusionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
