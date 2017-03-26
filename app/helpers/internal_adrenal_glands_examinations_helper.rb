module InternalAdrenalGlandsExaminationsHelper
  def translated_internal_adrenal_grands_cortex_thicknesses
    InternalAdrenalGlandsExamination.cortex_thicknesses.map do |thickness, _|
      [t("thickness.#{thickness}"), thickness]
    end
  end

  def translated_internal_adrenal_grands_medulla_thicknesses
    InternalAdrenalGlandsExamination.medulla_thicknesses.map do |thickness, _|
      [t("thickness.#{thickness}"), thickness]
    end
  end
end
