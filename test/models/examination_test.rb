# == Schema Information
#
# Table name: examinations
#
#  id                  :integer          not null, primary key
#  note                :text
#  autopsy_id          :integer          not null
#  examination_type_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
