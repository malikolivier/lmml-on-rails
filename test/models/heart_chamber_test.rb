# == Schema Information
#
# Table name: heart_chambers
#
#  id                            :integer          not null, primary key
#  internal_heart_examination_id :integer
#  category                      :integer          not null
#  size                          :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class HeartChamberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
