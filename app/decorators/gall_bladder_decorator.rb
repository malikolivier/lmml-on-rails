class GallBladderDecorator < ApplicationDecorator
  def description
    "#{bile_description}#{gallstones_description}"
  end

  private

  def bile_description
    if object.bile_quantity.present?
      if object.bile_none?
        '胆嚢内に胆汁なし。'
      elsif object.bile_unknown?
        '胆嚢内に胆汁があるかどうかは不明。'
      else
        color = object.bile_color.present? ? "#{I18n.t "colors.#{object.bile_color}"}の" : ''
        quantity = I18n.t "mass_quantity.#{object.bile_quantity}"
        "胆嚢内に#{color}胆汁#{quantity}量あり。"
      end
    else
      ''
    end
  end

  # TODO: Refactor
  # rubocop:disable Metrics/LineLength
  def gallstones_description
    if object.gallstones_quantity.blank?
      ''
    elsif object.gallstones_none?
      '胆石なし。'
    else
      color = object.gallstones_color.present? ? "#{I18n.t "colors.#{object.gallstones_color}"}の" : ''
      quantity = I18n.t "quantity.#{object.gallstones_quantity}"
      size = object.gallstones_size.present? ? "胆石は#{I18n.t "size.#{object.gallstones_size}"}。" : ''
      "#{color}胆石#{quantity}。#{size}"
    end
  end
end
