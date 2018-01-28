class ExternalNeckExaminationDecorator < ExaminationBaseDecorator
  def description
    if examination.injuries.none?
      t('.no_injury')
    else
      ''
    end
  end
end
