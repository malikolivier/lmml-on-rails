# A collection decorator referring to a dual object could inherit from this
# class (like the two ears, the two kidneys, etc.)
# The decorated single object should respond to the :left? and :right? messages.
class DualRecordsDecorator < ApplicationCollectionDecorator
  def left
    object.compact.select(&:left?).first&.decorate
  end

  def right
    object.compact.select(&:right?).first&.decorate
  end

  private

  def both_present?
    left.present? && right.present?
  end

  def attribute_equal?(attribute)
    both_present? &&
      (left.object.send(attribute) == right.object.send(attribute))
  end

  def attribute_equal_and_present?(attribute)
    attribute_equal?(attribute) && left.object.send(attribute).present?
  end

  def paired_attribute(attribute)
    left.object.send(attribute)
  end

  def translated_paired_attribute(attribute)
    left.object.translated_enum_value(attribute)
  end
end
