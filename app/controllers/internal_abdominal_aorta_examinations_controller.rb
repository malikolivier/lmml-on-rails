class InternalAbdominalAortaExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_abdominal_aorta_examination)
          .permit(:id, :arteriosclerosis,
                  examination_attributes: [:note])
  end
end
