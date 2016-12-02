# == Schema Information
#
# Table name: examination_types
#
#  id         :integer          not null, primary key
#  category   :integer          not null
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExaminationTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
