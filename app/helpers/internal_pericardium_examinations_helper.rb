module InternalPericardiumExaminationsHelper
  def translated_internal_pericardium_congestion
    InternalPericardiumExamination.congestions.map do |congestion, _|
      [t("intensity.#{congestion}"), congestion]
    end
  end

  def translated_internal_pericardium_petechia
    InternalPericardiumExamination.petechia.map do |quantity, _|
      [t("quantity.#{quantity}"), quantity]
    end
  end
end
