module InternalThoracicAortaExaminationsHelper
  def translated_internal_thoracic_aorta_arterioscleroses
    InternalThoracicAortaExamination.arterioscleroses.map do |intensity, _|
      [t("intensity.#{intensity}"), intensity]
    end
  end
end
