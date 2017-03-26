module InternalKidneysExaminationsHelper
  def translated_internal_kidneys_hardnesses
    InternalKidneysExamination.hardnesses.map do |hardness, _|
      [t("hardness.#{hardness}"), hardness]
    end
  end

  def translated_internal_kidneys_capsule_removals
    InternalKidneysExamination.capsule_removals.map do |difficulty, _|
      [t("difficulty.#{difficulty}"), difficulty]
    end
  end

  def translated_internal_kidneys_capsule_congestions
    InternalKidneysExamination.capsule_congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_kidneys_pelvis_congestions
    InternalKidneysExamination.pelvis_congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_kidneys_pelvis_petechia
    InternalKidneysExamination.pelvis_petechia.map do |petechia, _|
      [t("quantity.#{petechia}"), petechia]
    end
  end
end
