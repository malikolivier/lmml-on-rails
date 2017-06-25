class DrugDecorator < ApplicationDecorator
  delegate :name, :triage_concentration_threshold

  def description
    if object.abbr.present?
      t('.description', abbr: object.abbr, long_name: object.long_name)
    else
      object.long_name
    end
  end
end
