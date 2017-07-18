class AnalysisDiatomTestsController < AnalysesController
  private

  def update_params
    params.require(:analysis_diatom_test)
          .permit(:conclusion,
                  diatom_counts_attributes: %i[id category quantity],
                  analysis_attributes: [:note])
  end
end
