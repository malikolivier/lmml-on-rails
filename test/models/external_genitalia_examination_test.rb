# == Schema Information
#
# Table name: external_genitalia_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  hair_color     :integer
#  hair_length    :float
#  sex            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ExternalGenitaliaExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
