# == Schema Information
#
# Table name: autopsy_types
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  law        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AutopsyTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
