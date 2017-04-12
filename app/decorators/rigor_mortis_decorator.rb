class RigorMortisDecorator < ApplicationDecorator
  class << self
    def intensity_description(intensity)
      return '' if intensity.blank?
      value = RigorMortis.translated_enum_value(:intensity, intensity)
      I18n.t('rigores_mortis.intensity_description', intensity: value)
    end
  end
end
