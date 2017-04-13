# == Schema Information
#
# Table name: intestine_sections
#
#  id                                 :integer          not null, primary key
#  internal_intestines_examination_id :integer
#  category                           :integer          not null
#  color                              :integer
#  quantity                           :integer
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class IntestineSection < ApplicationRecord
  belongs_to :internal_intestines_examination, required: true

  enum category: %i[duodenum jejunum ileum colon]
  enum color: %i[yellowish yellow_green dark_brown], _prefix: true
  enum quantity: Settings.enums.five_scale_mass_quantity, _prefix: true,
       i18n_key: :mass_quantity

  def translated_name
    I18n.t "organs.#{category}"
  end

  def translated_color
    color.present? ? I18n.t("colors.#{color}") : ''
  end

  def translated_quantity
    quantity.present? ? I18n.t("mass_quantity.#{quantity}") : ''
  end

  def description
    content_name = colon? ? '便' : '内容'
    if quantity_none?
      "#{translated_name}に#{content_name}なし。"
    else
      "#{translated_name}に#{translated_color}" \
      "#{content_name}#{translated_quantity}量あり。"
    end
  end
end
