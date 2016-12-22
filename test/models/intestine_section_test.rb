# == Schema Information
#
# Table name: intestine_sections
#
#  id                                 :integer          not null, primary key
#  internal_intestines_examination_id :integer
#  category                           :integer          not null
#  color                              :integer
#  quantity                           :integer
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

require 'test_helper'

class IntestineSectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
