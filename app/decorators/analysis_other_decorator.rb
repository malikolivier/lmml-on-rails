class AnalysisOtherDecorator < AnalysisBaseDecorator
  delegate :content

  # Have AnalysisOtherDecorator have the same interface as AnalysisDecorator
  def section_title
    object.title
  end

  def partial_show_path
    'autopsies/analyses/other'
  end

  def get
    self
  end

  def note_description
    ''
  end
end
