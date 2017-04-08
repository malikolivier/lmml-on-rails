class AnalysisTypeDecorator < ApplicationDecorator
  delegate :other?

  def section_title
    t("section_title.analyses.#{model.name}")
  end

  def partial_show_path
    "autopsies/analyses/#{model.name}"
  end
end
