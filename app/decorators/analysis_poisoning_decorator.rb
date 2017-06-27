class AnalysisPoisoningDecorator < AnalysisBaseDecorator
  decorates_association :found_poisons
  decorates_association :chemical_analysis_methods

  def description
    result = if found_poisons.any?
               '以下の薬物が検出され、その血中濃度は以下のごとくであった'
             else
               '薬物が検出されなかった'
             end
    "#{contract_description}本屍の血液について、#{chemical_analysis_methods.description}" \
    "をおこなった結果、#{result}旨報告を受けた#{date_description}。"
  end

  private

  def contract_description
    "#{object.contract_institution.name}に依頼し、" if object.contract_institution.present?
  end

  def date_description
    "（#{object.date.to_era('%O%E年%m月%d日')}）" if object.date.present?
  end
end
