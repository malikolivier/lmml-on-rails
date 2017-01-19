module ExternalFaceExaminationsHelper
  def setup_external_face_examination(exam)
    exam.external_mouth_examination ||= ExternalMouthExamination.new
    exam
  end

  def translated_congestions
    ExternalFaceExamination.congestions.map do |existence, _|
      [t("existence.#{existence}"), existence]
    end
  end

  def translated_swellings
    ExternalFaceExamination.swellings.map do |swelling, _|
      [t("intensity.#{swelling}"), swelling]
    end
  end
end
