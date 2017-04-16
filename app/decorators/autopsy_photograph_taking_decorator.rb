class AutopsyPhotographTakingDecorator < ApplicationDecorator
  delegate :id, :category

  # Use "safe-navifation operator" (&.) to get less verbose code
  # Equivalent to model.photograph.caption unless model.photograph.caption.nil?
  def caption
    model.photograph &.caption
  end

  def picture_url
    model.photograph &.picture &.url
  end
end
