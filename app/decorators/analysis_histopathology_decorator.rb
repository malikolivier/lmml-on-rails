class AnalysisHistopathologyDecorator < AnalysisBaseDecorator
  def analyses_with_organs
    object.analysis_histopathology_on_organs.includes(:organ).decorate
  end
end
