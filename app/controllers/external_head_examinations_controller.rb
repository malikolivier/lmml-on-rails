class ExternalHeadExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_head_examination)
          .permit(:id,
                  examination_attributes: [:note])
  end
end
