module InternalAbdominalAortaExaminationsHelper
  def translated_internal_abdominal_aorta_arterioscleroses
    InternalAbdominalAortaExamination.arterioscleroses.map do |intensity, _|
      [t("intensity.#{intensity}"), intensity]
    end
  end
end
