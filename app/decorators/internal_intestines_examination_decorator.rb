class InternalIntestinesExaminationDecorator < ExaminationBaseDecorator
  decorates_association :intestine_sections

  delegate :description, to: :intestine_sections, prefix: true

  def no_injury_description
    return if any_injury?
    t('.no_injury')
  end

  def appendix_description
    if object.appendix_exists?
      t('.with_appendix')
    elsif object.appendix_does_not_exist?
      t('.no_appendix')
    end
  end
end
