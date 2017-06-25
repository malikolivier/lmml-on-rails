# == Schema Information
#
# Table name: instant_view_drug_results
#
#  id                       :integer          not null, primary key
#  analysis_instant_view_id :integer
#  drug_id                  :integer
#  result                   :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class InstantViewDrugResult < ApplicationRecord
  belongs_to :analysis_instant_view, required: true
  belongs_to :drug

  enum result: Settings.enums.tests.binary_result
end
