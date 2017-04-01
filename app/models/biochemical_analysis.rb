# == Schema Information
#
# Table name: biochemical_analyses
#
#  id                           :integer          not null, primary key
#  analysis_biochemistry_id     :integer
#  contract_institution_id      :integer
#  biochemical_analysis_type_id :integer
#  date                         :date
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BiochemicalAnalysis < ApplicationRecord
  belongs_to :analysis_biochemistry, required: true
  belongs_to :contract_institution, class_name: Institution
  belongs_to :biochemical_analysis_type, required: true
  delegate :experiment_description, to: :biochemical_analysis_type

  has_many :biochemical_analysis_results

  def description
    if contract_institution.present?
      "#{contract_description}#{experiment_description}ところ、" \
      "以下のような結果を得た旨報告を受けた#{date_description}。"
    else
      "#{biochemical_analysis_type.experiment_description}ところ、以下のような結果を得た。"
    end
  end

  def contract_description
    "#{contract_institution.name}に委託し、" if contract_institution.present?
  end

  def date_description
    "（#{date.to_era('%O%E年%m月%d日')}）" if date.present?
  end
end
