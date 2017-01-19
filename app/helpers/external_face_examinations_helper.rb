module ExternalFaceExaminationsHelper
  def translated_congestions
    ExternalFaceExamination.congestions.map do |existence, _|
      [t("existence.#{existence}"), existence]
    end
  end

  def translated_swellings
    ExternalFaceExamination.swellings.map do |swelling, _|
      [t("intensity.#{swelling}"), swelling]
    end
  end
end
