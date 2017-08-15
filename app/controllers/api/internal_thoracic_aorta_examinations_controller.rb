class Api::InternalThoracicAortaExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_thoracic_aorta_examination)
          .permit(:width, :arteriosclerosis,
                  examination_attributes: [:note])
  end
end
