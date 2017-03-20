module InternalLungsExaminationsHelper
  def translated_internal_lungs_air_contents
    InternalLungsExamination.air_contents.map do |content, _|
      [t("mass_quantity.#{content}"), content]
    end
  end

  def translated_internal_lungs_congestions
    InternalLungsExamination.congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end
end
