class AnalysisDecorator < ApplicationDecorator
  decorates_association :analysis_type
  decorates_association :get
  delegate :partial_show_path, :section_title, to: :analysis_type

  def note_description
    PhraseBuilder.new(model.note).to_sentence
  end
end
