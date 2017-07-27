class Api::PeritoneumForeignFluidsController < Api::ForeignFluidsController
  def create
    super
    exam = InternalAbdominalWallExamination.find(
      params[:internal_abdominal_wall_examination_id]
    )
    exam.peritoneum_foreign_fluids.push(@nested_model)
  end
end
