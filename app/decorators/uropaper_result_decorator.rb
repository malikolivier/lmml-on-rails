class UropaperResultDecorator < ApplicationDecorator
  delegate :descriptive_result

  def translated_category
    object.translated_enum_value(:category)
  end

  def no_result?
    object.result.blank?
  end
end
