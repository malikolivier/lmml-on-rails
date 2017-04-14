# A collection decorator referring to a dual object could inherit from this
# class (like the two ears, the two kidneys, etc.)
# The decorated single object should respond to the :left? and :right? messages.
class DualExaminationBasesDecorator < ApplicationCollectionDecorator
  def left
    decorated_collection.select do |single_decorated_object|
      single_decorated_object.object.left?
    end.first
  end

  def right
    decorated_collection.select do |single_decorated_object|
      single_decorated_object.object.right?
    end.first
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
end
