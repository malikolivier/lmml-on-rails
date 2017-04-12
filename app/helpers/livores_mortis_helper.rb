module LivoresMortisHelper
  def translated_livor_mortis_colors
    LivorMortis.colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_livor_mortis_positions
    LivorMortis.translated_enum!(:position)
  end

  def translated_livor_mortis_intensities
    LivorMortis.translated_enum!(:intensity)
  end

  def translated_livor_mortis_on_finger_pressures
    LivorMortis.translated_enum!(:on_finger_pressure)
  end
end
