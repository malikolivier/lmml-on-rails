# == Schema Information
#
# Table name: internal_stomach_examinations
#
#  id                :integer          not null, primary key
#  examination_id    :integer
#  content_color     :integer
#  content_smell     :integer
#  content_aspect    :integer
#  content_quantity  :float
#  content_digestion :integer
#  rugae             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InternalStomachExamination < ExaminationBase
  enum content_color: %i(unknown yellow green), _prefix: 'color'
  enum content_smell: %i(unknown putrid acid), _prefix: 'smell'
  enum content_aspect: %i(unknown watery), _prefix: 'aspect'
  enum content_digestion: %i(unknown not_digested digested partly_digested),
       _prefix: 'content'

  enum rugae: %i(unknown persistent not_persistent), _prefix: true

  def description
    "#{content_description}#{rugae_description}"
  end

  def content_description
    if content_quantity.blank?
      ''
    elsif content_quantity < 1
      'ほとんど空虚。'
    else
      filled_stomach_description
    end
  end

  def rugae_description
    if rugae_persistent?
      '粘膜の皺襞残る。'
    elsif rugae_not_persistent?
      '粘膜の皺襞伸びる。'
    else
      ''
    end
  end

  private

  def filled_stomach_description
    digestion = content_digestion.present? ? I18n.t("digestion.#{content_digestion}") : ''
    aspect = content_aspect.present? ? I18n.t("aspects.#{content_aspect}") : ''
    color = content_color.present? ? I18n.t("colors.#{content_color}") : ''
    quantity = content_quantity.present? ? "#{content_quantity}mL" : ''
    "内に#{digestion}のものを含む#{aspect}#{color}内容#{quantity}あり。"
  end
end
