# == Schema Information
#
# Table name: tooth_examinations
#
#  id                            :integer          not null, primary key
#  external_mouth_examination_id :integer          not null
#  position                      :integer          not null
#  rank                          :integer          not null
#  condition                     :integer          default("normal")
#  note                          :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'test_helper'

class ToothExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
