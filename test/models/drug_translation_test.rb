# == Schema Information
#
# Table name: drug_translations
#
#  id         :integer          not null, primary key
#  drug_id    :integer
#  name       :text
#  long_name  :text
#  language   :string(5)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DrugTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
