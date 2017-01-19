module ExternalMouthExaminationsHelper
  def translated_external_mouth_examination_closeds
    ExternalMouthExamination.closeds.map do |closedness, _|
      [t("closedness.#{closedness}"), closedness]
    end
  end

  def translated_external_mouth_examination_petechia
    ExternalMouthExamination.petechia.map do |petechia, _|
      [t("quantity.#{petechia}"), petechia]
    end
  end

  def translated_external_mouth_examination_tongue_tips
    ExternalMouthExamination.tongue_tips.map do |tongue_tip, _|
      [t("tongue_tips.#{tongue_tip}"), tongue_tip]
    end
  end
end
