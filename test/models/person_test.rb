# == Schema Information
#
# Table name: people
#
#  id                               :integer          not null, primary key
#  name                             :text
#  sex                              :integer
#  death_age                        :integer
#  dob                              :date
#  title                            :text
#  institution_id                   :integer
#  identification_number            :text
#  autopsies_examiner_count         :integer          default(0)
#  autopsies_suspect_count          :integer          default(0)
#  autopsies_victim_count           :integer          default(0)
#  autopsies_police_inspector_count :integer          default(0)
#  autopsies_judge_count            :integer          default(0)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
