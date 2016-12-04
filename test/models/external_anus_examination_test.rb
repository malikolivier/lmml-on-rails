# == Schema Information
#
# Table name: external_anus_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  closed         :integer
#  feces_quantity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ExternalAnusExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
