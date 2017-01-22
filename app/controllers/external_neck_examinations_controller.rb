class ExternalNeckExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_neck_examination)
          .permit(examination_attributes: [:note])
  end
end
