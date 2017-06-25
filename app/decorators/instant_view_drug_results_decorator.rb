class InstantViewDrugResultsDecorator < ApplicationCollectionDecorator
  def none_positive?
    positive.none?
  end

  def positive_drugs_description
    positive.map(&:drug_name).to_sentence
  end

  private

  def positive
    object.positive.decorate
  end
end
