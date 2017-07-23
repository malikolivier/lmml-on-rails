class Api::InternalBladderExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_bladder_examination)
          .permit(:id, :urine_color, :urine_quantity, :urine_transparency,
                  :membrane_color, examination_attributes: [:note])
  end
end
