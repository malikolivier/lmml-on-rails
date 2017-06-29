class AnalysisEthanolDecorator < AnalysisBaseDecorator
  delegate :found?

  def description
    result = if object.found?
               '次の結果を得た'
             else
               'エタノールは検出されなかった'
             end
    "#{contract_description}本屍の心臓・総腸骨静脈血について、" \
    '気化平衡法によるガスクロマトグラフィーによりエタノールの定量試験をおこなったところ、' \
    "#{result}旨報告を受けた#{date_description}。"
  end

  def heart_concentration_present?
    object.heart_concentration.present?
  end

  def iliac_vein_concentration_present?
    object.iliac_vein_concentration.present?
  end

  def heart_concentration_description
    "#{object.heart_concentration} mg/mL"
  end

  def iliac_vein_concentration_description
    "#{object.iliac_vein_concentration} mg/mL"
  end

  private

  def contract_description
    return '' if object.contract_institution.blank?
    "#{object.contract_institution.name}に依頼し、"
  end

  def date_description
    "（#{object.date.to_era('%O%E年%m月%d日')}）" if object.date.present?
  end
end
