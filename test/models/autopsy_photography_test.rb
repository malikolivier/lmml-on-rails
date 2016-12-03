# == Schema Information
#
# Table name: autopsy_photographies
#
#  id            :integer          not null, primary key
#  category      :integer
#  autopsy_id    :integer
#  photograph_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class AutopsyPhotographyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
