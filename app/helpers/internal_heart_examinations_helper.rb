module InternalHeartExaminationsHelper
  def translated_internal_heart_rigores_mortis
    InternalHeartExamination.rigores_mortis.map do |rigor_mortis, _|
      [t("existence.#{rigor_mortis}"), rigor_mortis]
    end
  end

  def translated_internal_heart_epicardial_lipomatoses
    InternalHeartExamination.epicardial_lipomatoses.map do |lipomatosis, _|
      [t("existence.#{lipomatosis}"), lipomatosis]
    end
  end

  def translated_internal_heart_epicardial_petechia
    InternalHeartExamination.epicardial_petechia.map do |petechia, _|
      [t("quantity.#{petechia}"), petechia]
    end
  end

  def translated_internal_heart_extracted_blood_colors
    InternalHeartExamination.extracted_blood_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_internal_heart_extracted_blood_coagulations
    InternalHeartExamination.extracted_blood_coagulations.map do |coag, _|
      [t("existence.#{coag}"), coag]
    end
  end

  def translated_internal_heart_scar_lefts
    InternalHeartExamination.scar_lefts.map do |scar, _|
      [t("existence.#{scar}"), scar]
    end
  end

  def translated_internal_heart_scar_rights
    InternalHeartExamination.scar_rights.map do |scar, _|
      [t("existence.#{scar}"), scar]
    end
  end

  def translated_internal_heart_pulmonary_artery_thrombuses
    InternalHeartExamination.pulmonary_artery_thrombuses.map do |thrombus, _|
      [t("existence.#{thrombus}"), thrombus]
    end
  end
end
