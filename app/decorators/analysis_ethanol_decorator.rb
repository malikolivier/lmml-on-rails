class AnalysisEthanolDecorator < AnalysisBaseDecorator
  delegate :found?

  def description
    result = if object.found?
               t('.detected')
             else
               t('.not_detected')
             end
    t('.full_description', contract: contract_description, result: result,
                           date: date_description)
  end

  def heart_concentration_present?
    object.heart_concentration.present?
  end

  def iliac_vein_concentration_present?
    object.iliac_vein_concentration.present?
  end

  def heart_concentration_description
    "#{object.heart_concentration} mg/mL"
  end

  def iliac_vein_concentration_description
    "#{object.iliac_vein_concentration} mg/mL"
  end

  private

  def contract_description
    return '' if object.contract_institution.blank?
    t('.contract_description', institution: object.contract_institution.name)
  end

  def date_description
    return '' if object.date.present?
    t('.date_description', formatted_date: h.format_official_date(object.date))
  end
end
