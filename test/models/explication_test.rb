# == Schema Information
#
# Table name: explications
#
#  id         :integer          not null, primary key
#  title      :text
#  content    :text
#  autopsy_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
