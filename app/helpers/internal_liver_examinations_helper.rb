module InternalLiverExaminationsHelper
  def setup_internal_liver_examination(exam)
    exam.gall_bladder ||= GallBladder.new
    exam
  end

  def translated_internal_liver_hardnesses
    InternalLiverExamination.hardnesses.map do |hardness, _|
      [t("hardness.#{hardness}"), hardness]
    end
  end

  def translated_internal_liver_congestions
    InternalLiverExamination.congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_liver_steatoses
    InternalLiverExamination.steatoses.map do |steatosis, _|
      [t("intensity.#{steatosis}"), steatosis]
    end
  end
end
