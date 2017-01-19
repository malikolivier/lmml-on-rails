module ExternalEyeExaminationsHelper
  def translated_external_eye_examination_closeds
    ExternalEyeExamination.closeds.map do |closedness, _|
      [t("closedness.#{closedness}"), closedness]
    end
  end

  def translated_external_eye_examination_eyelid_congestions
    ExternalEyeExamination.eyelid_congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_external_eye_examination_eyelid_petechia
    ExternalEyeExamination.eyelid_petechia.map do |petechia, _|
      [t("quantity.#{petechia}"), petechia]
    end
  end

  def translated_external_eye_examination_conjunctiva_congestions
    ExternalEyeExamination.conjunctiva_congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_external_eye_examination_conjunctiva_petechia
    ExternalEyeExamination.conjunctiva_petechia.map do |petechia, _|
      [t("quantity.#{petechia}"), petechia]
    end
  end
end
