module IntestineSectionsHelper
  def translated_intestine_section_colors
    IntestineSection.colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_intestine_section_quantities
    IntestineSection.quantities.map do |quantity, _|
      [t("mass_quantity.#{quantity}"), quantity]
    end
  end
end
