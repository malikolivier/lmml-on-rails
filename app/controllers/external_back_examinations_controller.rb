class ExternalBackExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_back_examination)
          .permit(examination_attributes: [:note])
  end
end
