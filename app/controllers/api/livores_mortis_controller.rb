class Api::LivoresMortisController < Api::ExaminationNestedModelsController
  private

  def create_params
    params.require(:livor_mortis)
          .permit(:external_outline_examination_id)
  end
end
