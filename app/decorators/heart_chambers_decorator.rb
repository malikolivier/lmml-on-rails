class HeartChambersDecorator < ApplicationCollectionDecorator
  def description
    return if object.none?
    grouped_heart_chambers = group_by(&:size)
    chamber_descriptions = []
    HeartChamber.sizes.each do |size, _| # rubocop:disable Metrics/BlockLength
      next if grouped_heart_chambers[size].blank?
      size_name = I18n.t "size.#{size}"
      status = 0b0
      status |= grouped_heart_chambers[size].any?(&:left_ventricle?) ? 1 : 0
      status |= grouped_heart_chambers[size].any?(&:right_ventricle?) ? 2 : 0
      status |= grouped_heart_chambers[size].any?(&:left_atrium?) ? 4 : 0
      status |= grouped_heart_chambers[size].any?(&:right_atrium?) ? 8 : 0
      case status
      when 0b0001
        chamber_descriptions.push("左心室は#{size_name}")
      when 0b0010
        chamber_descriptions.push("右心室は#{size_name}")
      when 0b0011
        chamber_descriptions.push("左右心室は#{size_name}")
      when 0b0100
        chamber_descriptions.push("左心房は#{size_name}")
      when 0b0101
        chamber_descriptions.push("右心室・左心房は#{size_name}")
      when 0b0110
        chamber_descriptions.push("左心室・左心房は#{size_name}")
      when 0b0111
        chamber_descriptions.push("左右の心室・左心房は#{size_name}")
      when 0b1000
        chamber_descriptions.push("右心房は#{size_name}")
      when 0b1001
        chamber_descriptions.push("左心室・右心房は#{size_name}")
      when 0b1010
        chamber_descriptions.push("右心室・右心房は#{size_name}")
      when 0b1011
        chamber_descriptions.push("左右心室・右心房は#{size_name}")
      when 0b1100
        chamber_descriptions.push("左右心房は#{size_name}")
      when 0b1101
        chamber_descriptions.push("右心室・左右心房は#{size_name}")
      when 0b1110
        chamber_descriptions.push("左心室・左右心房は#{size_name}")
      when 0b1111
        chamber_descriptions.push("左右の心室・心房は#{size_name}")
      else
        chamber_descriptions.push("Unhandled status value: #{status}")
      end
    end
    chamber_descriptions.to_sentence(words_connector: '、',
                                     last_word_connector: '、')
  end
end
