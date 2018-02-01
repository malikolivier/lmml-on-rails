class IntestineSectionsDecorator < ApplicationCollectionDecorator
  def description
    h.join_sentences(map(&:description))
  end
end
