class AnalysisPoisoningDecorator < AnalysisBaseDecorator
  decorates_association :found_poisons
  decorates_association :chemical_analysis_methods

  def description
    result = if found_poisons.any?
               t('.drugs_found')
             else
               t('.no_drug')
             end
    t('.full_description', contract: contract_description,
                           methods: chemical_analysis_methods.description,
                           result: result,
                           date: date_description)
  end

  private

  def contract_description
    return '' if object.contract_institution.blank?
    t('.contract_description', institution: object.contract_institution.name)
  end

  def date_description
    return '' if object.date.blank?
    t('.date_description', formatted_date: h.format_official_date(object.date))
  end
end
