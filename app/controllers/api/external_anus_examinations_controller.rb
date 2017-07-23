class Api::ExternalAnusExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:external_anus_examination)
          .permit(:closed, :feces_quantity, examination_attributes: [:note])
  end
end
