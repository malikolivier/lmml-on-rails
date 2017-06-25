class AnalysisTriagesController < AnalysesController
  private

  def update_params
    params.require(:analysis_triage)
          .permit(triage_drug_results_attributes: %i[id drug_id result],
                  analysis_attributes: [:note])
  end
end
