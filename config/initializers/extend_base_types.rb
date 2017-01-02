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

  def to_sentence_with_comma
    self.to_sentence(words_connector: '、', last_word_connector: '、', two_words_connector: '、')
  end

  def to_sentence_with_comma_and_full_stop
    self.empty? ? '' : "#{self.to_sentence_with_comma}。"
  end
end

# Extend FormBuilder to build Vue-friendly forms
class ActionView::Helpers::FormBuilder
  def text_field_v(object_name, options = {})
    options[:'v-model'] ||= object_name
    text_field(object_name, options)
  end

  def number_field_v(object_name, options = {})
    options[:'v-model.number'] ||= object_name
    number_field(object_name, options)
  end

  def time_field_v(object_name, options = {})
    options[:'v-model'] ||= object_name
    options[:value] ||= object.send(object_name).strftime('%H:%M') unless object.send(object_name).blank?
    time_field(object_name, options)
  end

  def date_field_v(object_name, options = {})
    options[:'v-model'] ||= object_name
    date_field(object_name, options)
  end
end
