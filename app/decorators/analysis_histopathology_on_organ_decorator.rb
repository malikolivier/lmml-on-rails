class AnalysisHistopathologyOnOrganDecorator < ApplicationDecorator
  def description
    t('.description', organ_name: organ_name, result: object.result)
  end

  private

  def organ_name
    if object.organ.present?
      object.organ.name
    else
      object.other_organ
    end
  end
end
