# == Schema Information
#
# Table name: analysis_poisonings
#
#  id                      :integer          not null, primary key
#  analysis_id             :integer
#  contract_institution_id :integer
#  date                    :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class AnalysisPoisoning < ApplicationRecord
  belongs_to :analysis, required: true
  belongs_to :contract_institution, class_name: Institution

  has_many :found_poisons
  has_many :chemical_analysis_methods, through: :found_poisons

  def description
    result = if found_poisons.any?
               '以下の薬物が検出され、その血中濃度は以下のごとくであった'
             else
               '薬物が検出されなかった'
             end
    "#{contract_description}本屍の血液について、#{chemical_analysis_method_description}をおこなった結果、#{result}旨報告を受けた#{date_description}。"
  end

  def contract_description
    "#{contract_institution.name}に依頼し、" if contract_institution.present?
  end

  def chemical_analysis_method_description
    method_name = []
    chemical_analysis_methods.includes(:translations).each do |method|
      method_name.push(method.name)
    end
    method_name.to_sentence
  end

  def date_description
    "（#{date.to_era('%O%E年%m月%d日')}）" if date.present?
  end
end
