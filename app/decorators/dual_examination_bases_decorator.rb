class DualExaminationBasesDecorator < DualRecordsDecorator
  def examination_note
    if left.present?
      left.examination.note_description
    elsif right.present?
      right.examination.note_description
    end
  end
end
