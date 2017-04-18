class ParticipationsController < ExaminationNestedModelsController
  private

  def create_params
    params.require(:participation)
          .permit(:autopsy_id)
  end
end
