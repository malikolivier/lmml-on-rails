# == Schema Information
#
# Table name: coronary_arteries
#
#  id                            :integer          not null, primary key
#  internal_heart_examination_id :integer
#  category                      :integer          not null
#  stenosis                      :float
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class CoronaryArteryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
