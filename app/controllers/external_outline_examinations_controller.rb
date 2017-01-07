class ExternalOutlineExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_outline_examination)
          .permit(:id, :sex, :partial_body, :height, :weight, :constitution,
                  :rectal_temperature, :room_temperature,
                  livores_mortis_attributes: [:id, :color, :position,
                                              :intensity, :on_finger_pressure],
                  rigores_mortis_attributes: [:id, :joint, :intensity,
                                              :category])
  end
end
