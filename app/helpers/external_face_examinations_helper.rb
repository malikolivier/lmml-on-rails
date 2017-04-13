module ExternalFaceExaminationsHelper
  def setup_external_face_examination(exam)
    exam.external_mouth_examination ||= ExternalMouthExamination.new
    exam
  end
end
