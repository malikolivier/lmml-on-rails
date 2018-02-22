class InternalAdrenalGlandsExaminationsDecorator < DualExaminationBasesDecorator
  # rubocop: disable AbcSize, BlockLength, CyclomaticComplexity, MethodLength
  # rubocop: disable PerceivedComplexity
  def description
    cortex_group = group_by(&:cortex_thickness)
    medulla_group = group_by(&:medulla_thickness)
    descriptions = PhraseBuilder.new(only_comma: true)
    InternalAdrenalGlandsExamination.cortex_thicknesses.each_key do |thickness|
      next if cortex_group[thickness].blank? && medulla_group[thickness].blank?
      thickness_name = InternalAdrenalGlandsExamination
                       .translated_enum_value(:cortex_thickness, thickness)
      status = 0b0
      if cortex_group[thickness].present?
        status |= cortex_group[thickness].any?(&:left?) ? 1 : 0
        status |= cortex_group[thickness].any?(&:right?) ? 2 : 0
      end
      if medulla_group[thickness].present?
        status |= medulla_group[thickness].any?(&:left?) ? 4 : 0
        status |= medulla_group[thickness].any?(&:right?) ? 8 : 0
      end
      descriptions << case status
                      when 0b0001
                        t('.left_cortex', thickness: thickness_name)
                      when 0b0010
                        t('.right_cortex', thickness: thickness_name)
                      when 0b0011
                        t('.left_right_cortex', thickness: thickness_name)
                      when 0b0100
                        t('.left_medulla', thickness: thickness_name)
                      when 0b0101
                        t('.left_cortex_left_medulla',
                          thickness: thickness_name)
                      when 0b0110
                        t('.right_cortex_left_medulla',
                          thickness: thickness_name)
                      when 0b0111
                        t('.left_right_cortex_left_medulla',
                          thickness: thickness_name)
                      when 0b1000
                        t('.right_medulla', thickness: thickness_name)
                      when 0b1001
                        t('.left_cortex_right_medulla',
                          thickness: thickness_name)
                      when 0b1010
                        t('.right_cortex_right_medulla',
                          thickness: thickness_name)
                      when 0b1011
                        t('.left_right_cortex_right_medulla',
                          thickness: thickness_name)
                      when 0b1100
                        t('.left_right_medulla', thickness: thickness_name)
                      when 0b1101
                        t('.left_cortex_left_right_medulla',
                          thickness: thickness_name)
                      when 0b1110
                        t('.right_cortex_left_right_medulla',
                          thickness: thickness_name)
                      when 0b1111
                        t('.left_right_cortex_left_right_medulla',
                          thickness: thickness_name)
                      else
                        "Unhandled status value: #{status}"
                      end
    end
    descriptions.to_sentence
  end
  # rubocop:enable AbcSize, BlockLength, CyclomaticComplexity, MethodLength
  # rubocop:enable PerceivedComplexity
end
