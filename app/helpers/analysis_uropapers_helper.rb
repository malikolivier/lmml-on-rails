module AnalysisUropapersHelper
  def setup_analysis_uropaper(uro)
    missing_categories = UropaperResult.categories.map { |v, _k| v } -
                         uro.uropaper_results.map(&:category)
    missing_categories.each do |c|
      uro.uropaper_results.build(category: c)
    end
    uro
  end
end
