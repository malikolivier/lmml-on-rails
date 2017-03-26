module InternalIntestinesExaminationsHelper
  def translated_internal_intestines_appendixes
    InternalIntestinesExamination.appendixes.map do |appendix, _|
      [t("existence.#{appendix}"), appendix]
    end
  end
end
