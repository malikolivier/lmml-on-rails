# == Schema Information
#
# Table name: internal_adrenal_glands_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  deixis            :integer
#  cortex_thickness  :integer
#  medulla_thickness :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class InternalAdrenalGlandsExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
