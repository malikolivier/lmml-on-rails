class ExternalEarExaminationDecorator < DualExaminationBaseDecorator
  delegate :bleeding?

  def description
    injury_description + bleeding_description
  end

  def no_injury?
    model.injury.blank?
  end

  private

  def injury_description
    if no_injury?
      t('.no_injury', deixis: translated_deixis)
    else
      t('.has_injury', deixis: translated_deixis)
    end
  end

  def bleeding_description
    if model.bleeding?
      t('.has_bleeding')
    else
      t('.no_bleeding')
    end
  end
end
