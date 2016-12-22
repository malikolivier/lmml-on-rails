# == Schema Information
#
# Table name: internal_stomach_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  content_color     :integer
#  content_smell     :integer
#  content_aspect    :integer
#  content_quantity  :float
#  content_digestion :integer
#  rugae             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class InternalStomachExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
