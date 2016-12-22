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

class InternalStomachExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum content_color: [:yellow, :green], _prefix: 'content'
  enum content_smell: [:putrid, :acid], _prefix: 'content'
  enum content_aspect: [:watery], _prefix: 'content'
  enum content_digestion: [:not_digested, :digested, :partly_digested, :unknown],
       _prefix: 'content'

  enum rugae: [:persistent, :not_persistent, :unknown], _prefix: true

  def description
    "#{content_description}#{rugae_description}"
  end

  def content_description
    if content_quantity.blank?
      ''
    elsif content_quantity < 1
      'ほとんど空虚。'
    else
      digestion = content_digestion.present? ? I18n.t("digestion.#{content_digestion}") : ''
      aspect = content_aspect.present? ? I18n.t("aspect.#{content_aspect}") : ''
      color = content_color.present? ? I18n.t("colors.#{content_color}") : ''
      quantity = content_quantity.present? ? "#{content_quantity}mL" : ''
      "内に#{digestion}のものを含む#{aspect}#{color}内容#{quantity}あり。"
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
end
