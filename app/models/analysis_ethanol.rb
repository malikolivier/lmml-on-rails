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

class AnalysisEthanol < AnalysisBase
  belongs_to :contract_institution, class_name: Institution

  before_save :set_found

  def set_found
    self.found = heart_concentration_positive? ||
                 iliac_vein_concentration_positive?
    true # Return true to show success
  end

  def found?
    found
  end

  def heart_concentration_positive?
    heart_concentration.present? && heart_concentration.positive?
  end

  def iliac_vein_concentration_positive?
    iliac_vein_concentration.present? && iliac_vein_concentration.positive?
  end
end
