module RigoresMortisHelper
  def translated_rigor_mortis_joints
    RigorMortis.joints.map do |joint, _|
      [t("body_parts.#{joint}"), joint]
    end
  end

  def translated_rigor_mortis_intensities
    RigorMortis.intensities.map do |intensity, _|
      [t("intensity.#{intensity}"), intensity]
    end
  end

  def translated_rigor_mortis_categories
    RigorMortis.categories.map do |category, _|
      [t("rigor_mortis.#{category}"), category]
    end
  end
end
