class InternalCraniumExaminationDecorator < ExaminationBaseDecorator
  def no_injury_description
    return if any_injury?
    t('.no_injury')
  end
end
