class Api::InternalAdrenalGlandsExaminationsController < Api::DualExaminationsController
  private

  def update_params
    params.require(:internal_adrenal_glands_examination)
          .permit(:deixis, :cortex_thickness, :medulla_thickness,
                  examination_attributes: [:note])
  end
end
