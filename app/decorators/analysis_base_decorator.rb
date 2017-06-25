class AnalysisBaseDecorator < ApplicationDecorator
  decorates_association :analysis

  def analysis_note
    analysis.note_description
  end
end
