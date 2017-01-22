module ForeignFluidsHelper
  def translated_foreign_fluid_colors
    ForeignFluid.colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_foreign_fluid_odors
    ForeignFluid.odors.map do |odor, _|
      [t("odors.#{odor}"), odor]
    end
  end
end
