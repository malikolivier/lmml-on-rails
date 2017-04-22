# 全角文字に変換する関数
class String
  def to_full_width
    to_s.tr!('0-9a-zA-Z', '０-９ａ-ｚＡ-Ｚ')
  end
end

class Integer
  delegate :to_full_width, to: :to_s

  def to_full_width_letter
    ('Ａ'..'Ｚ').first(self).last
  end
end

class Numeric
  def degrees
    self * Math::PI / 180
  end
  alias degree degrees

  def to_deg
    self / Math::PI * 180
  end
end

# TODO: Delete this monkey-patch on arrays. This is to be replaced by the
# PhraseBuilder class
class Array
  def to_sentence_with_full_stop(options = {})
    empty? ? '' : "#{to_sentence(options)}。"
  end

  def to_sentence_with_comma
    to_sentence(words_connector: '、', last_word_connector: '、',
                two_words_connector: '、')
  end

  def to_sentence_with_comma_and_full_stop
    empty? ? '' : "#{to_sentence_with_comma}。"
  end
end
