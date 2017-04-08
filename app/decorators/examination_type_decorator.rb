class ExaminationTypeDecorator < ApplicationDecorator
  def section_title
    t("section_title.#{model.category}.#{model.name}")
  end

  def partial_show_path
    "autopsies/#{model.category}/#{model.name}"
  end
end
