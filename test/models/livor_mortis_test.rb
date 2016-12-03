# == Schema Information
#
# Table name: livores_mortis
#
#  id                              :integer          not null, primary key
#  color                           :integer
#  position                        :integer
#  intensity                       :integer
#  on_fingure_pressure             :integer
#  external_outline_examination_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

require 'test_helper'

class LivorMortisTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
