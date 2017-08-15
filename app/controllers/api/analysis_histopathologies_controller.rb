class Api::AnalysisHistopathologiesController < Api::AnalysesController
  private

  def update_params
    params.require(:analysis_histopathology)
          .permit(analysis_histopathology_on_organs_attributes:
                    %i[id organ_id other_organ result],
                  analysis_attributes: [:note])
  end
end
