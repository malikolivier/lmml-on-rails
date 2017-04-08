class ExaminationDecorator < ApplicationDecorator
  decorates_association :examination_type
  decorates_association :get
  delegate :section_title, :partial_show_path, to: :examination_type

  def external?
    model.examination_type.external?
  end

  def internal?
    model.examination_type.internal?
  end

  def head?
    model.examination_type.head?
  end

  def torso?
    model.examination_type.torso?
  end

  def note_description
    PhraseBuilder.new(model.note).to_sentence
  end

  def injuries_description
    t('.no_injury') if examination.injuries.none?
  end
end
