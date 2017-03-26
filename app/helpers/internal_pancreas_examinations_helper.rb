module InternalPancreasExaminationsHelper
  def translated_internal_pancreas_hardnesses
    InternalPancreasExamination.hardnesses.map do |hardness, _|
      [t("hardness.#{hardness}"), hardness]
    end
  end
end
