module InternalAbdominalWallExaminationsHelper
  def translated_internal_abdomnial_walls_subcutaneous_fat_levels
    InternalAbdominalWallExamination.subcutaneous_fat_levels.map do |level, _|
      [t("growth.#{level}"), level]
    end
  end

  def translated_internal_abdomnial_walls_air_in_digestive_tracks
    InternalAbdominalWallExamination
      .air_in_digestive_tracks.map do |air_quantity, _|
        [t("quantity.#{air_quantity}"), air_quantity]
      end
  end
end
