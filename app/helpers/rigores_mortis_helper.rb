module RigoresMortisHelper
  def translated_rigor_mortis_joints
    RigorMortis.translated_enum!(:joint)
  end

  def translated_rigor_mortis_intensities
    RigorMortis.intensities.map do |intensity, _|
      [t("intensity.#{intensity}"), intensity]
    end
  end

  def translated_rigor_mortis_categories
    RigorMortis.translated_enum(:category)
  end
end
