# == Schema Information
#
# Table name: test_histopathology_organs
#
#  id                     :integer          not null, primary key
#  test_histopathology_id :integer
#  organ_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class TestHistopathologyOrganTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
