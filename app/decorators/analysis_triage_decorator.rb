class AnalysisTriageDecorator < AnalysisBaseDecorator
  decorates_association :triage_drug_results

  def description
    description = '本屍の尿につき、検査キット添付の検査方法に準じてトライエージ乱用薬物スクリーニングを行ったところ、'
    if triage_drug_results.positive.any?
      description += "#{triage_drug_results.positive_drugs_description}陽性対照領域に明瞭なバンドが出現する"
    end
    if triage_drug_results.not_positive.any?
      description += '一方で、以下の全ての薬物領域ならびに陰性対照領域には明らかなバンドは出現しなかった。'
    else
      description += '。'
    end
    description
  end

  def not_positive_results
    triage_drug_results.not_positive
  end
end
