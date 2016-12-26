# == Schema Information
#
# Table name: organs
#
#  id                                 :integer          not null, primary key
#  name                               :text
#  subject_to_histopathology_analysis :boolean          default(FALSE)
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

require 'test_helper'

class OrganTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
