class AnalysisUropapersController < AnalysesController
  private

  def update_params
    params.require(:analysis_uropaper)
          .permit(:ph,
                  uropaper_results_attributes: %i[id category result],
                  analysis_attributes: [:note])
  end
end
