class InternalPericardiumExaminationDecorator < ExaminationBaseDecorator
  def congestion_description
    return if object.congestion.blank?
    t('.congestion', intensity: object.translated_enum_value(:congestion))
  end

  def petechia_description
    return if object.petechia.blank?
    t('.petechia', quantity: object.translated_enum_value(:petechia))
  end
end
