# == Schema Information
#
# Table name: biochemical_analysis_type_translations
#
#  id                           :integer          not null, primary key
#  biochemical_analysis_type_id :integer
#  language                     :string(5)        not null
#  title                        :text
#  experiment_description       :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class BiochemicalAnalysisTypeTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
