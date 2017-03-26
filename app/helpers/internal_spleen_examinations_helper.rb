module InternalSpleenExaminationsHelper
  def translated_internal_spleen_hardnesses
    InternalSpleenExamination.hardnesses.map do |hardness, _|
      [t("hardness.#{hardness}"), hardness]
    end
  end

  def translated_internal_spleen_congestions
    InternalSpleenExamination.congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_spleen_pulp_distincts
    InternalSpleenExamination.pulp_distincts.map do |pulp, _|
      [t("clarity.#{pulp}"), pulp]
    end
  end
end
