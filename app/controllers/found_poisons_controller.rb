class FoundPoisonsController < ExaminationNestedModelsController
  private

  def create_params
    params.require(:found_poison)
          .permit(:analysis_poisoning_id)
  end
end
