class DiatomCountDecorator < ApplicationDecorator
  delegate :quantity, :found?

  def translated_quantity
    object.translated_enum_value(:quantity)
  end

  def descriptive_quantity
    I18n.t("diatom_test.descriptive_quantity.#{quantity}")
  end
end
