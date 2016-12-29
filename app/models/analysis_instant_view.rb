# == Schema Information
#
# Table name: analysis_instant_views
#
#  id          :integer          not null, primary key
#  analysis_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnalysisInstantView < ApplicationRecord
  belongs_to :analysis, required: true

  has_many :instant_view_drug_results
  has_many :drugs, through: :instant_view_drug_results

  def description
    description = '本屍の尿につき検査キット添付の検査方法に準じてインスタントビュー濫用薬物スクリーニングをおこなったところ、'
    if instant_view_drug_results.none?(&:positive?)
      description += '全ての薬物領域には明らかな陽性反応は出現しなかった。'
    else
      drug_names = []
      instant_view_drug_results.positive.each do |result|
        drug_names.push(result.drug.translated_name)
      end
      description += "#{drug_names.to_sentence}陽性対照領域に明瞭な反応が出現する一方で、それ以外の全ての薬物領域には明らかな陽性反応は出現しなかった。"
    end
    description
  end
end
