class AnalysisTypeDecorator < ApplicationDecorator
  delegate :other?, :name

  def section_title
    t("section_title.analyses.#{model.name}")
  end

  def partial_show_path
    "autopsies/analyses/#{model.name}"
  end

  def head_id
    "analysis_#{model.name}_head"
  end
end
