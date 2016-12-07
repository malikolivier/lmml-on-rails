# == Schema Information
#
# Table name: autopsies
#
#  id                  :integer          not null, primary key
#  completed           :boolean          default(FALSE)
#  number              :text
#  autopsy_type_id     :integer
#  examiner_id         :integer
#  suspect_id          :integer
#  victim_id           :integer
#  place_id            :integer
#  autopsy_date        :date
#  starting_time       :datetime
#  ending_time         :datetime
#  police_station_id   :integer
#  police_inspector_id :integer
#  court_id            :integer
#  judge_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class AutopsyTest < ActiveSupport::TestCase
  test 'a complete autopsy should have all examination type' do
    complete_autopsy = autopsies(:completed_autopsy)
    all_examination_types = ExaminationType.all
    skip('Not implemented yet as all examination
          type fixtures are not yet there');
  end
end
