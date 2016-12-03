# == Schema Information
#
# Table name: external_head_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  hair_natural_color :integer
#  hair_dyed_color    :integer
#  top_hair_length    :float
#  side_hair_length   :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ExternalHeadExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
