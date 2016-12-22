# == Schema Information
#
# Table name: gall_bladders
#
#  id                            :integer          not null, primary key
#  internal_liver_examination_id :integer
#  bile_color                    :integer
#  bile_quantity                 :integer
#  gallstones_quantity           :integer
#  gallstones_color              :integer
#  gallstones_size               :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class GallBladderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
