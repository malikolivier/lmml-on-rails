# == Schema Information
#
# Table name: internal_lungs_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  deixis         :integer          not null
#  weight         :float
#  air_content    :integer
#  congestion     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternalLungsExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
