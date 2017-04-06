module ApplicationHelper
  def form_to_vue(object_name, method)
    match = object_name.match(/^\w*\[(.*)\]$/)
    if match
      "#{match.captures.join('.')}.#{method}_attributes"
    else
      "#{method}_attributes"
    end
  end

  def join_sentences(*sentences)
    delimiter = I18n.translate!('punctuation.sentence_joiner')
    sentences.join(delimiter)
  end

  def join_words(*words)
    delimiter = I18n.translate!('punctuation.word_joiner')
    words.join(delimiter)
  end
end
