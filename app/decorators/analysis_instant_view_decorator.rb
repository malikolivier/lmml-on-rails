class AnalysisInstantViewDecorator < AnalysisBaseDecorator
  decorates_association :instant_view_drug_results

  def description
    result = if instant_view_drug_results.none_positive?
               t('.no_positive')
             else
               drugs = instant_view_drug_results.positive_drugs_description
               t('.has_positive', drugs_description: drugs)
             end
    t('.complete_description', result: result)
  end
end
