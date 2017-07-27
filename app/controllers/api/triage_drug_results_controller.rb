class Api::TriageDrugResultsController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:triage_drug_result)
          .permit(:analysis_triage_id)
  end
end
