class CoronaryArteryDecorator < ApplicationDecorator
  def description
    t('.description', name: name, stenosis: object.stenosis)
  end

  def stenosis?
    object.stenosis.positive?
  end

  def name
    object.translated_enum_value(:category)
  end
end
