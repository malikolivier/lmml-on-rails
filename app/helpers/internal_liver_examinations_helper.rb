module InternalLiverExaminationsHelper
  def setup_internal_liver_examination(exam)
    exam.gall_bladder ||= GallBladder.new
    exam
  end
end
