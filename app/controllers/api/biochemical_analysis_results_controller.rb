class Api::BiochemicalAnalysisResultsController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:biochemical_analysis_result)
          .permit(:biochemical_analysis_id)
  end
end
