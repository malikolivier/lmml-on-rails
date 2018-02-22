class HeartChambersDecorator < ApplicationCollectionDecorator
  # rubocop:disable AbcSize, CyclomaticComplexity
  # rubocop:disable PerceivedComplexity, MethodLength
  def description
    return if object.none?
    grouped_heart_chambers = group_by(&:size)
    chamber_descriptions = PhraseBuilder.new
    HeartChamber.sizes.each_key do |size| # rubocop:disable Metrics/BlockLength
      next if grouped_heart_chambers[size].blank?
      size_name = HeartChamber.translated_enum_value(:size, size)
      status = 0b0
      status |= grouped_heart_chambers[size].any?(&:left_ventricle?) ? 1 : 0
      status |= grouped_heart_chambers[size].any?(&:right_ventricle?) ? 2 : 0
      status |= grouped_heart_chambers[size].any?(&:left_atrium?) ? 4 : 0
      status |= grouped_heart_chambers[size].any?(&:right_atrium?) ? 8 : 0
      chamber_descriptions << case status
                              when 0b0001
                                t('.left_ventricle', size: size_name)
                              when 0b0010
                                t('.right_ventricle', size: size_name)
                              when 0b0011
                                t('.left_right_ventricle', size: size_name)
                              when 0b0100
                                t('.left_atrium', size: size_name)
                              when 0b0101
                                t('.right_ventricle_left_atrium',
                                  size: size_name)
                              when 0b0110
                                t('.left_ventricle_left_atrium',
                                  size: size_name)
                              when 0b0111
                                t('.left_right_ventricle_left_atrium',
                                  size: size_name)
                              when 0b1000
                                t('.right_atrium', size: size_name)
                              when 0b1001
                                t('.left_ventricle_right_atrium',
                                  size: size_name)
                              when 0b1010
                                t('.right_ventricle_right_atrium',
                                  size: size_name)
                              when 0b1011
                                t('.left_right_ventricle_right_atrium',
                                  size: size_name)
                              when 0b1100
                                t('.left_right_atrium',
                                  size: size_name)
                              when 0b1101
                                t('.right_ventricle_left_right_atrium',
                                  size: size_name)
                              when 0b1110
                                t('.left_ventricle_left_right_atrium',
                                  size: size_name)
                              when 0b1111
                                t('.left_right_ventricle_left_right_atrium',
                                  size: size_name)
                              else
                                "Unhandled status value: #{status}"
                              end
    end
    chamber_descriptions.to_sentence_no_dot
  end
  # rubocop:enable AbcSize, CyclomaticComplexity
  # rubocop:enable PerceivedComplexity, MethodLength
end
