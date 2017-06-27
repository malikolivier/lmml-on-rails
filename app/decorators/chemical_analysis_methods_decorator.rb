class ChemicalAnalysisMethodsDecorator < ApplicationCollectionDecorator
  def description
    object.map(&:name).to_sentence
  end
end
