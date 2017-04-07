class LivorMortisDecorator < ApplicationDecorator
  class << self
    def intensity_description(intensity)
      return '' if intensity.blank?
      value = LivorMortis.translated_enum_value(:intensity, intensity)
      I18n.t('livores_mortis.intensity_description', intensity: value)
    end

    def color_description(color)
      return '' if color.blank?
      value = LivorMortis.translated_enum_value(:color, color)
      I18n.t('livores_mortis.color_description', color: value)
    end
  end
end
