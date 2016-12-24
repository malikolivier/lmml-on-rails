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
  test 'analyses should be properly ordered' do
    complete_autopsy = autopsies(:completed_autopsy)
    ordered_analises = Analysis.where(autopsy: complete_autopsy)
                               .joins(:analysis_type)
                               .where.not(analysis_types: { name: 'other' })
                               .order('`analysis_types`.`placement`')
                               .to_a
    ordered_analises += Analysis.where(autopsy: complete_autopsy)
                               .joins(:analysis_type)
                               .joins(:analysis_other)
                               .where(analysis_types: { name: 'other' })
                               .order('`analysis_others`.`placement`')
                               .to_a
    complete_autopsy.analyses.to_a.should eq ordered_analises
  end
end
