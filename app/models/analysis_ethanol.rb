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

class AnalysisEthanol < ApplicationRecord
  belongs_to :analysis, required: true
  belongs_to :contract_institution, class_name: Institution

  before_save :set_found

  def set_found
    self.found = (heart_concentration.present? && heart_concentration.positive?) ||
                 (iliac_vein_concentration.present? && iliac_vein_concentration.positive?)
    true # Return true to show success
  end

  def found?
    found
  end

  def description
    result = if found?
               '次の結果を得た'
             else
               'エタノールは検出されなかった'
             end
    "#{contract_description}本屍の心臓・総腸骨静脈血について、気化平衡法によるガスクロマトグラフィーによりエタノールの定量試験をおこなったところ、#{result}旨報告を受けた#{date_description}。"
  end

  def contract_description
    "#{contract_institution.name}に依頼し、" if contract_institution.present?
  end
    def date_description
      "（#{date.to_era('%O%E年%m月%d日')}）" if date.present?
    end
end
