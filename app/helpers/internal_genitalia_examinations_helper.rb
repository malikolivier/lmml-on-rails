module InternalGenitaliaExaminationsHelper
  def translated_internal_genitalia_endometrium_colors
    InternalGenitaliaExamination.endometrium_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_internal_genitalia_ovaries_presences
    InternalGenitaliaExamination.ovaries_presences.map do |presence, _|
      key = 'activerecord.enums.internal_genitalia_examination.ovaries_presence'
      [t("#{key}.#{presence}"), presence]
    end
  end
end
