# == Schema Information
#
# Table name: gall_bladders
#
#  id                            :integer          not null, primary key
#  internal_liver_examination_id :integer
#  bile_color                    :integer
#  bile_quantity                 :integer
#  gallstones_quantity           :integer
#  gallstones_color              :integer
#  gallstones_size               :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class GallBladder < ApplicationRecord
  belongs_to :internal_liver_examination, required: true

  enum bile_color: %i(dark_green yellowish brown), _prefix: 'bile'
  enum bile_quantity: Settings.enums.five_scale_mass_quantity, _prefix: 'bile'
  enum gallstones_quantity: Settings.enums.five_scale_quantity,
       _prefix: 'gallstones'
  enum gallstones_color: %i(yellow yellow_green green brown),
       _prefix: 'gallstones'
  enum gallstones_size: Settings.enums.size,
       _prefix: 'gallstones'

  def description
    "#{bile_description}#{gallstones_description}"
  end

  def bile_description
    if bile_quantity.present?
      if bile_none?
        '胆嚢内に胆汁なし。'
      elsif bile_unknown?
        '胆嚢内に胆汁があるかどうかは不明。'
      else
        color = bile_color.present? ? "#{I18n.t "colors.#{bile_color}"}の" : ''
        quantity = I18n.t "mass_quantity.#{bile_quantity}"
        "胆嚢内に#{color}胆汁#{quantity}量あり。"
      end
    else
      ''
    end
  end

  def gallstones_description
    if gallstones_quantity.blank?
      ''
    elsif gallstones_none?
      '胆石なし。'
    else
      color = gallstones_color.present? ? "#{I18n.t "colors.#{gallstones_color}"}の" : ''
      quantity = I18n.t "quantity.#{gallstones_quantity}"
      size = gallstones_size.present? ? "胆石は#{I18n.t "size.#{gallstones_size}"}。" : ''
      "#{color}胆石#{quantity}。#{size}"
    end
  end
end
