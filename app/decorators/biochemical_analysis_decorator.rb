class BiochemicalAnalysisDecorator < ApplicationDecorator
  decorates_association :biochemical_analysis_results

  def title(index)
    "#{index}) #{object.biochemical_analysis_type.title}"
  end

  def description
    if object.contract_institution.present?
      "#{contract_description}#{experiment_description}ところ、" \
      "以下のような結果を得た旨報告を受けた#{date_description}。"
    else
      "#{experiment_description}ところ、以下のような結果を得た。"
    end
  end

  private

  def experiment_description
    object.biochemical_analysis_type.experiment_description
  end

  def contract_description
    "#{object.contract_institution.name}に委託し、" if object.contract_institution.present?
  end

  def date_description
    "（#{object.date.to_era('%O%E年%m月%d日')}）" if object.date.present?
  end
end
