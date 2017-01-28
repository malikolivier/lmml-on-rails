module InternalBrainExaminationsHelper
  def translated_internal_brain_pia_congestions
    InternalBrainExamination.pia_congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_brain_blood_spots
    InternalBrainExamination.blood_spots.map do |quantity, _|
      [t("quantity.#{quantity}"), quantity]
    end
  end
end
