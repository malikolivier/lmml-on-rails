class ExternalAnusExaminationDecorator < ExaminationBaseDecorator
  def closedness_description
    return if object.closed.blank?
    if object.closed?
      t('.closed')
    else
      t('.open')
    end
  end

  def feces_quantity_description
    return if object.feces_quantity.blank?
    t('.feces_quantity',
      quantity: object.translated_enum_value(:feces_quantity))
  end
end
