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
end
