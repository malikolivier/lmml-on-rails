# == Schema Information
#
# Table name: molecule_translations
#
#  id          :integer          not null, primary key
#  molecule_id :integer
#  language    :string
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MoleculeTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
