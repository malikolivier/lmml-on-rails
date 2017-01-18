module ExternalHeadExaminationsHelper
  def translated_hair_natural_colors
    ExternalHeadExamination.hair_natural_colors.map do |color, _|
      [t("hair_colors.#{color}"), color]
    end
  end

  def translated_hair_dyed_colors
    ExternalHeadExamination.hair_dyed_colors.map do |color, _|
      [t("hair_colors.#{color}"), color]
    end
  end
end
