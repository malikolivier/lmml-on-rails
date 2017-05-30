# == Schema Information
#
# Table name: analysis_blood_types
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  anti_a      :integer
#  anti_b      :integer
#  anti_h      :integer
#  blood_type  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisBloodType < AnalysisBase
  enum anti_a: Settings.enums.tests.binary_result, _prefix: true
  enum anti_b: Settings.enums.tests.binary_result, _prefix: true
  enum anti_h: Settings.enums.tests.binary_result, _prefix: true
  enum blood_type: %i[A B O AB unknown]
end
