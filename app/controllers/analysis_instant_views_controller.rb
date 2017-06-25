class AnalysisInstantViewsController < AnalysesController
  private

  def update_params
    params.require(:analysis_instant_view)
          .permit(instant_view_drug_results_attributes: %i[id drug_id result],
                  analysis_attributes: [:note])
  end
end
