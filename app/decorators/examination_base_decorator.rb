class ExaminationBaseDecorator < ApplicationDecorator
  decorates_association :examination

  def examination_note
    examination.note_description
  end
end
