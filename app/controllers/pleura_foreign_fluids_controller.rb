class PleuraForeignFluidsController < ForeignFluidsController
  def create
    super
    exam = InternalAbdominalWallExamination.find(
      params[:internal_abdominal_wall_examination_id]
    )
    exam.pleura_foreign_fluids.push(@nested_model)
  end
end
