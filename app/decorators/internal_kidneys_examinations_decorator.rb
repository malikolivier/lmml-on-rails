class InternalKidneysExaminationsDecorator < DualExaminationBasesDecorator
  def weight_description
    phrase = PhraseBuilder.new(only_comma: true)
    if attribute_equal_and_present?(:weight)
      phrase << t('.same_weight', weight: paired_attribute(:weight))
    else
      phrase << left&.weight_description
      phrase << right&.weight_description
    end
    phrase.to_sentence
  end

  def organ_description
    if all_symetric?
      left&.description
    else
      two_organ_description
    end
  end

  private

  def all_symetric?
    attribute_equal?(:hardness) && attribute_equal?(:capsule_removal) &&
      attribute_equal?(:capsule_congestion) &&
      attribute_equal?(:pelvis_congestion) &&
      attribute_equal?(:pelvis_petechia)
  end

  def two_organ_description
    out = [left&.description_with_deixis.to_s]
    out << h.tag(:br)
    out << right&.description_with_deixis.to_s
    h.safe_join(out)
  end
end
