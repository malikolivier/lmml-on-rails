class ExaminationBaseDecorator < ApplicationDecorator
  decorates_association :examination

  def examination_note
    examination.note_description
  end

  def any_injury?
    examination.injuries.any?
  end
end
