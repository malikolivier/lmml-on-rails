module LivoresMortisHelper
  def translated_livor_mortis_colors
    LivorMortis.colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_livor_mortis_positions
    LivorMortis.positions.map do |position, _|
      [t("body_parts.#{position}"), position]
    end
  end

  def translated_livor_mortis_intensities
    LivorMortis.intensities.map do |intensity, _|
      [t("intensity.#{intensity}"), intensity]
    end
  end

  def translated_livor_mortis_on_finger_pressures
    LivorMortis.on_finger_pressures.map do |on_finger_pressure, _|
      [t("colors.#{on_finger_pressure}"), on_finger_pressure]
    end
  end
end
