# TODO: ExaminationNestedModelsController should be renamed as it is used for
# analyses AND examinations.
class Api::AnalysisHistopathologyOnOrgansController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:analysis_histopathology_on_organ)
          .permit(:analysis_histopathology_id)
  end
end
