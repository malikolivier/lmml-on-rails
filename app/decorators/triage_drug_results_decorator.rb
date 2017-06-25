class TriageDrugResultsDecorator < ApplicationCollectionDecorator
  def none_positive?
    positive.none?
  end

  def positive_drugs_description
    positive.map(&:drug_name).to_sentence
  end

  def positive
    object.positive.decorate
  end

  def not_positive
    object.not_positive.decorate
  end
end
