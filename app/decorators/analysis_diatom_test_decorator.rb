class AnalysisDiatomTestDecorator < AnalysisBaseDecorator
  decorates_association :left_lung
  decorates_association :right_lung
  decorates_association :water_with_destruction

  def description
    if left_lung.quantity.blank? && right_lung.quantity.blank?
      t('.uncomplete_report')
    else
      "#{first_paragraph}
    　<p>#{second_paragraph}</p>"
    end
  end

  private

  def first_paragraph
    if right_lung.quantity == left_lung.quantity
      lungs_same_quantity
    else
      found_in_lungs_different_quantities
    end
  end

  def second_paragraph
    if water_with_destruction.found?
      t('.water_with_destruction_found', quantity: water.translated_quantity,
                                         conclusion: conclusion_description)
    else
      t('.water_with_destruction_not_found', conclusion: conclusion_description)
    end
  end

  def lungs_same_quantity
    if left_lung.found?
      t('.found_in_lungs_same_quantity',
        experiment: t('.experiment'), quantity: left_lung.translated_quantity,
        descriptive_quantity: left_lung.descriptive_quantity)
    else
      t('.not_found_in_lungs', experiment: t('.experiment'))
    end
  end

  def found_in_lungs_different_quantities
    results = PhraseBuilder.new(left_lung.quantity_description,
                                right_lung.quantity_description)
    descriptive_results = PhraseBuilder.new(
      left_lung.descriptive_quantity_description,
      right_lung.descriptive_quantity_description
    )
    t('.found_in_lungs_different_quantities',
      experiment: t('.experiment'), results: results.to_sentence,
      descriptive_results: descriptive_results.to_sentence)
  end

  def conclusion_description
    object.translated_enum_value(:conclusion)
  end
end
