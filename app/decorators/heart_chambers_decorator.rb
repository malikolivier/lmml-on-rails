class HeartChambersDecorator < ApplicationCollectionDecorator
  # rubocop:disable AbcSize, CyclomaticComplexity
  # rubocop:disable PerceivedComplexity, MethodLength,
  def description
    return if object.none?
    grouped_heart_chambers = group_by(&:size)
    chamber_descriptions = PhraseBuilder.new
    HeartChamber.sizes.each do |size, _| # rubocop:disable Metrics/BlockLength
      next if grouped_heart_chambers[size].blank?
      size_name = HeartChamber.translated_enum_value(:size, size)
      status = 0b0
      status |= grouped_heart_chambers[size].any?(&:left_ventricle?) ? 1 : 0
      status |= grouped_heart_chambers[size].any?(&:right_ventricle?) ? 2 : 0
      status |= grouped_heart_chambers[size].any?(&:left_atrium?) ? 4 : 0
      status |= grouped_heart_chambers[size].any?(&:right_atrium?) ? 8 : 0
      case status
      when 0b0001
        chamber_descriptions << t('.left_ventricle', size: size_name)
      when 0b0010
        chamber_descriptions << t('.right_ventricle', size: size_name)
      when 0b0011
        chamber_descriptions << t('.left_right_ventricle', size: size_name)
      when 0b0100
        chamber_descriptions << t('.left_atrium', size: size_name)
      when 0b0101
        chamber_descriptions << t('.right_ventricle_left_atrium',
                                  size: size_name)
      when 0b0110
        chamber_descriptions << t('.left_ventricle_left_atrium',
                                  size: size_name)
      when 0b0111
        chamber_descriptions << t('.left_right_ventricle_left_atrium',
                                  size: size_name)
      when 0b1000
        chamber_descriptions << t('.right_atrium', size: size_name)
      when 0b1001
        chamber_descriptions << t('.left_ventricle_right_atrium',
                                  size: size_name)
      when 0b1010
        chamber_descriptions << t('.right_ventricle_right_atrium',
                                  size: size_name)
      when 0b1011
        chamber_descriptions << t('.left_right_ventricle_right_atrium',
                                  size: size_name)
      when 0b1100
        chamber_descriptions << t('.left_right_atrium',
                                  size: size_name)
      when 0b1101
        chamber_descriptions << t('.right_ventricle_left_right_atrium',
                                  size: size_name)
      when 0b1110
        chamber_descriptions << t('.left_ventricle_left_right_atrium',
                                  size: size_name)
      when 0b1111
        chamber_descriptions << t('.left_right_ventricle_left_right_atrium',
                                  size: size_name)
      else
        chamber_descriptions << "Unhandled status value: #{status}"
      end
    end
    chamber_descriptions.to_sentence_no_dot
  end
end
