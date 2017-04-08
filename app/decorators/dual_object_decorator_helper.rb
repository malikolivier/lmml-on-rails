# Must be included in a collection decorator referring to a dual object
# (like the two ears, the two kidneys, etc.)
# The decorated single object should respond to the :left? and :right? messages.
module DualObjectDecoratorHelper
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
end
