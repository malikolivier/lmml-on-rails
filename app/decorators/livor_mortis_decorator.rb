class LivorMortisDecorator < ApplicationDecorator
  class << self
    def intensity_description(intensity)
      return '' if intensity.blank?
      value = LivorMortis.translated_enum_value(:intensity, intensity)
      I18n.t('livores_mortis.intensity_description', intensity: value)
    end
  end
end
