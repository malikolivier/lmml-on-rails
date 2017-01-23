module ExternalAnusExaminationsHelper
  def translated_anus_closeds
    ExternalAnusExamination.closeds.map do |closed, _|
      [t("closedness.#{closed}"), closed]
    end
  end

  def translated_anus_feces_quantities
    ExternalAnusExamination.feces_quantities.map do |feces_quantity, _|
      [t("quantity.#{feces_quantity}"), feces_quantity]
    end
  end
end
