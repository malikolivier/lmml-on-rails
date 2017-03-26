module InternalStomachExaminationsHelper
  def translated_internal_stomach_content_colors
    InternalStomachExamination.content_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_internal_stomach_content_smells
    InternalStomachExamination.content_smells.map do |smell, _|
      [t("odors.#{smell}"), smell]
    end
  end

  def translated_internal_stomach_content_aspects
    InternalStomachExamination.content_aspects.map do |aspect, _|
      [t("aspects.#{aspect}"), aspect]
    end
  end

  def translated_internal_stomach_content_digestions
    InternalStomachExamination.content_digestions.map do |digestion, _|
      [t("digestion.#{digestion}"), digestion]
    end
  end

  def translated_internal_stomach_rugae
    InternalStomachExamination.rugae.map do |rugae, _|
      [t("activerecord.enums.internal_stomach_examination.rugae.#{rugae}"),
       rugae]
    end
  end
end
