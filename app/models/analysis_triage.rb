# == Schema Information
#
# Table name: analysis_triages
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisTriage < AnalysisBase
  has_many :triage_drug_results
  has_many :drugs, through: :triage_drug_results

  accepts_nested_attributes_for :triage_drug_results, reject_if: :all_blank

  def description
    description = '本屍の尿につき、検査キット添付の検査方法に準じてトライエージ乱用薬物スクリーニングを行ったところ、'
    if triage_drug_results.any?(&:positive?)
      drug_names = []
      triage_drug_results.positive.each do |result|
        drug_names.push(result.drug.name)
      end
      description += "#{drug_names.to_sentence}陽性対照領域に明瞭なバンドが出現する"
    end
    if triage_drug_results.any? { |result| result.negative? || result.unknown? }
      description += '一方で、以下の全ての薬物領域ならびに陰性対照領域には明らかなバンドは出現しなかった。'
    else
      description += '。'
    end
    description
  end
end
