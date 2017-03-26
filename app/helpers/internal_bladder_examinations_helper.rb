module InternalBladderExaminationsHelper
  def translated_internal_bladder_urine_colors
    InternalBladderExamination.urine_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_internal_bladder_urine_transparencies
    InternalBladderExamination.urine_transparencies.map do |transparency, _|
      [t("transparency.#{transparency}"), transparency]
    end
  end

  def translated_internal_bladder_membrane_colors
    InternalBladderExamination.membrane_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end
end
