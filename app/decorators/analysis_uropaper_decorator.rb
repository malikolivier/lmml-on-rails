class AnalysisUropaperDecorator < AnalysisBaseDecorator
  decorates_association :uropaper_results
  delegate :ph
end
