module ExternalGenitaliaExaminationsHelper
  def translated_genitalia_hair_colors
    ExternalGenitaliaExamination.hair_colors.map do |color, _|
      [t("pubic_hair_colors.#{color}"), color]
    end
  end

  def translated_genitalia_sexes
    ExternalGenitaliaExamination.sexes.map do |sex, _|
      [t("sex.#{sex}"), sex]
    end
  end
end
