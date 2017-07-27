class Api::RigoresMortisController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:rigor_mortis)
          .permit(:external_outline_examination_id, :joint)
  end
end
