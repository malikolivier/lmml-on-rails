# == Schema Information
#
# Table name: external_ear_examinations
#
#  id                           :integer          not null, primary key
#  deixis                       :integer          not null
#  bleeding                     :boolean          default(FALSE)
#  injury_id                    :integer
#  external_head_examination_id :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class ExternalEarExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
