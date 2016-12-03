# == Schema Information
#
# Table name: rigores_mortis
#
#  id                              :integer          not null, primary key
#  joint                           :integer          not null
#  intensity                       :integer
#  category                        :integer
#  external_outline_examination_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

require 'test_helper'

class RigorMortisTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
