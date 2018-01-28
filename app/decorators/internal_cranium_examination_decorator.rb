class InternalCraniumExaminationDecorator < ExaminationBaseDecorator
  def no_injury_description
    return if examination.injuries.any?
    t('.no_injury')
  end
end
