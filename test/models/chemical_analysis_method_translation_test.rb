# == Schema Information
#
# Table name: chemical_analysis_method_translations
#
#  id                          :integer          not null, primary key
#  chemical_analysis_method_id :integer
#  language                    :string(5)        not null
#  name                        :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class ChemicalAnalysisMethodTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
