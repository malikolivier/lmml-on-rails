class AnalysisTriageDecorator < AnalysisBaseDecorator
  decorates_association :triage_drug_results

  def description
    return '' if result_description.blank?
    t('.complete_description', result: result_description)
  end

  def not_positive_results
    triage_drug_results.not_positive
  end

  private

  def result_description
    if any_positive_results?
      result_including_positives
    elsif any_not_positive_results?
      t('.no_positive')
    end
  end

  def result_including_positives
    drugs = triage_drug_results.positive_drugs_description
    positive_results = t('.has_positive', drugs_description: drugs)
    if any_not_positive_results?
      t('.full_result', has_positive: positive_results,
                        no_positive: t('.no_positive'))
    else
      t('.only_positive_result', has_positive: positive_results)
    end
  end

  def any_positive_results?
    triage_drug_results.positive.any?
  end

  def any_not_positive_results?
    triage_drug_results.not_positive.any?
  end
end
