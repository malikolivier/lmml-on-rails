class Api::InstantViewDrugResultsController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:instant_view_drug_result)
          .permit(:analysis_instant_view_id)
  end
end
