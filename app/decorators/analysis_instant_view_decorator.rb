class AnalysisInstantViewDecorator < AnalysisBaseDecorator
  decorates_association :instant_view_drug_results

  def description
    description = '本屍の尿につき検査キット添付の検査方法に準じてインスタントビュー濫用薬物スクリーニングをおこなったところ、'
    if instant_view_drug_results.none_positive?
      description += '全ての薬物領域には明らかな陽性反応は出現しなかった。'
    else
      description += "#{instant_view_drug_results.positive_drugs_description}陽性対照領域に明瞭な反応が出現する一方で、" \
                     'それ以外の全ての薬物領域には明らかな陽性反応は出現しなかった。'
    end
    description
  end
end
