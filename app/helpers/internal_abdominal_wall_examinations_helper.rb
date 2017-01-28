module InternalAbdominalWallExaminationsHelper
  def translated_internal_abdomnial_walls_subcutaneous_fat_levels
    InternalAbdominalWallExamination.subcutaneous_fat_levels.map do |level, _|
      [t("growth.#{level}"), level]
    end
  end
end
