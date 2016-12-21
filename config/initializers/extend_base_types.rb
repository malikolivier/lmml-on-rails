# 全角文字に変換する関数
class String
  def to_full_width
    self.to_s.tr!('0-9a-zA-Z', '０-９ａ-ｚＡ-Ｚ')
  end
end

class Fixnum
  def to_full_width
    self.to_s.to_full_width
  end
  def to_full_width_letter
    ('Ａ'..'Ｚ').first(self).last
  end
end

class Array
  def to_sentence_with_full_stop(options = {})
    self.empty? ? '' : "#{self.to_sentence(options)}。"
  end

  def to_sentence_with_comma_and_full_stop
    self.empty? ? '' : "#{self.to_sentence(words_connector: '、', last_word_connector: '、', two_words_connector: '、')}。"
  end
end
