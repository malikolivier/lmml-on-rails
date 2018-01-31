class CoronaryArteriesDecorator < ApplicationCollectionDecorator
  def description
    return if object.none?
    phrases = []
    stenosis_count = 0
    each do |artery|
      phrases.push(artery.description)
      stenosis_count += 1 if artery.stenosis?
    end
    if stenosis_count.zero?
      phrases = []
      each do |artery|
        phrases.push(artery.name)
      end
      "#{phrases.to_sentence}に硬化性狭窄なし。"
    else
      description = "#{phrases.to_sentence(words_connector: '、',
                                           last_word_connector: '、')}" \
                    'の硬化性狭窄がある'
      if object.blood_clot.none?
        "#{description}が、血栓はない。"
      else
        # TODO: make something more descriptive,
        # though I do not really know what to say
        "#{description}。"
      end
    end
  end
end
