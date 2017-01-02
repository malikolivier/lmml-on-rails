# == Schema Information
#
# Table name: institutions
#
#  id                             :integer          not null, primary key
#  name                           :text
#  address                        :text
#  autopsies_place_count          :integer          default(0)
#  autopsies_police_station_count :integer          default(0)
#  autopsies_court_count          :integer          default(0)
#  institution_type_id            :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
