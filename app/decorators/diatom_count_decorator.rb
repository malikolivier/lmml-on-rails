class DiatomCountDecorator < ApplicationDecorator
  delegate :quantity, :found?

  def translated_quantity
    object.translated_enum_value(:quantity)
  end

  def descriptive_quantity
    I18n.t("diatom_counts.descriptive_quantity.#{quantity}")
  end

  def quantity_description
    return if object.quantity.blank?
    if object.left_lung?
      t('.left_lung', quantity: translated_quantity)
    elsif object.right_lung?
      t('.right_lung', quantity: translated_quantity)
    end
  end

  def descriptive_quantity_description
    return if object.quantity.blank?
    if object.left_lung?
      t('.descriptive_left_lung', descriptive_quantity: descriptive_quantity)
    elsif object.right_lung?
      t('.descriptive_right_lung', descriptive_quantity: descriptive_quantity)
    end
  end
end
