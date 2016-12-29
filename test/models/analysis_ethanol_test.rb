# == Schema Information
#
# Table name: analysis_ethanols
#
#  id                       :integer          not null, primary key
#  analysis_id              :integer
#  contract_institution_id  :integer
#  found                    :boolean          not null
#  date                     :date
#  heart_concentration      :float
#  iliac_vein_concentration :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class AnalysisEthanolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
