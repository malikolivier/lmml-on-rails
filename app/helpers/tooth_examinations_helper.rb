module ToothExaminationsHelper
  def translated_tooth_examination_conditions
    ToothExamination.conditions.map do |condition, _|
      [t("tooth_condition.#{condition}"), condition]
    end
  end
end
