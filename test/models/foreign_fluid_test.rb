# == Schema Information
#
# Table name: foreign_fluids
#
#  id          :integer          not null, primary key
#  color       :integer
#  name        :text
#  description :text
#  odor        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ForeignFluidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
