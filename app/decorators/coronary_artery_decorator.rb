class CoronaryArteryDecorator < ApplicationDecorator
  def description
    "#{name}に#{object.stenosis}%"
  end

  def stenosis?
    object.stenosis.positive?
  end

  def name
    I18n.t "organs.#{object.category}"
  end
end
