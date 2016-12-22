# == Schema Information
#
# Table name: internal_genitalia_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  length            :float
#  fundal_width      :float
#  cervical_width    :float
#  endometrium_color :integer
#  ovaries_presence  :integer
#  ovaries_distance  :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class InternalGenitaliaExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
