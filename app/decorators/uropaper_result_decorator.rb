class UropaperResultDecorator < ApplicationDecorator
  delegate :descriptive_result

  def translated_category
    t("uropapers.#{object.category}")
  end
end
