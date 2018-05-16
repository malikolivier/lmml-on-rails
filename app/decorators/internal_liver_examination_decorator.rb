class InternalLiverExaminationDecorator < ExaminationBaseDecorator
  decorates_association :gall_bladder

  delegate :description, to: :gall_bladder, prefix: true, allow_nil: true

  def weight_description
    return if object.weight.blank?
    t('.weight', weight: object.weight)
  end

  def hardness_description
    return if object.hardness.blank?
    t('.hardness', hardness: object.translated_enum_value(:hardness))
  end

  def congestion_description
    return if object.congestion.blank?
    t('.congestion', intensity: object.translated_enum_value(:congestion))
  end

  def steatosis_description
    return if object.steatosis.blank?
    t('.steatosis', intensity: object.translated_enum_value(:steatosis))
  end

  def no_injury_description
    return if any_injury?
    t('.no_injury')
  end
end
