class AnalysisDecorator < ApplicationDecorator
  decorates_association :analysis_type
  decorates_association :get
  delegate :partial_show_path, to: :analysis_type

  def section_title
    if analysis_type.other?
      get.title
    else
      analysis_type.section_title
    end
  end

  def note_description
    PhraseBuilder.new(model.note).to_sentence
  end
end
