# == Schema Information
#
# Table name: molecules
#
#  id                    :integer          not null, primary key
#  standard_quantity_min :float
#  standard_quantity_max :float
#  unit                  :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class MoleculeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
