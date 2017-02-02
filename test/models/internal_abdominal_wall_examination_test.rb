# == Schema Information
#
# Table name: internal_abdominal_wall_examinations
#
#  id                         :integer          not null, primary key
#  examination_id             :integer
#  subcutaneous_fat_level     :integer
#  subcutaneous_fat_thickness :float
#  diaphragm_height_left      :float
#  diaphragm_height_right     :float
#  pleura_adhesion            :integer
#  air_in_digestive_track     :integer
#  peritoneum_adhesion        :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'test_helper'

class InternalAbdominalWallExaminationTest < ActiveSupport::TestCase
  test 'JSON set without error' do
    assert_equal(InternalAbdominalWallExamination.json_includes,
                 pleura_foreign_fluids: {},
                 peritoneum_foreign_fluids: {},
                 examination: {})
  end
end
