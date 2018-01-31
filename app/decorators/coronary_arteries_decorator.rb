class CoronaryArteriesDecorator < ApplicationCollectionDecorator
  def description
    return if object.none?
    if no_stenosis?
      t('.no_stenosis', arteries: artery_names)
    elsif object.blood_clot.none?
      t('.stenosis_no_blood_clot', arteries_desc: artery_descriptions)
    else
      t('.stenosis_blood_clot', arteries_desc: artery_descriptions)
    end
  end

  private

  def artery_descriptions
    PhraseBuilder.new(map(&:description), only_comma: true).to_sentence_no_dot
  end

  def artery_names
    map(&:name).to_sentence
  end

  def no_stenosis?
    map(&:stenosis?).none?
  end
end
