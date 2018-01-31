class DualExaminationBasesDecorator < DualRecordsDecorator
  def examination_note
    if left.present?
      left.examination.note_description
    elsif right.present?
      right.examination.note_description
    end
  end

  def any_injury?
    if left.present?
      left.examination.injuries.any?
    elsif right.present?
      right.examination.injuries.any?
    end
  end
end
