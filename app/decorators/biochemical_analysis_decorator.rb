class BiochemicalAnalysisDecorator < ApplicationDecorator
  decorates_association :biochemical_analysis_results

  def title(index)
    return if object.biochemical_analysis_type.blank?
    t('.title', index: index, title: object.biochemical_analysis_type.title)
  end

  def description
    if object.contract_institution.present?
      t('.with_contractor_description', contract: contract_description,
                                        experiment: experiment_description,
                                        date: date_description)
    else
      t('.no_contractor_description', experiment: experiment_description)
    end
  end

  private

  def experiment_description
    return if object.biochemical_analysis_type.blank?
    object.biochemical_analysis_type.experiment_description
  end

  def contract_description
    return '' if object.contract_institution.blank?
    t('.contract_description', institution: object.contract_institution.name)
  end

  def date_description
    return '' if object.date.blank?
    t('.date_description', formatted_date: h.format_official_date(object.date))
  end
end
