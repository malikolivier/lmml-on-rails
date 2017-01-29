module InternalNeckOrgansExaminationsHelper
  def translated_internal_neck_organs_lymph_levels
    InternalNeckOrgansExamination.lymph_levels.map do |level, _|
      [t("growth.#{level}"), level]
    end
  end
end
