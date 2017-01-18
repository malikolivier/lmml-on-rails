class ExternalOutlineExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_outline_examination)
          .permit(:id, :sex, :partial_body, :height, :weight, :constitution,
                  :rectal_temperature, :room_temperature,
                  :livor_mortis_note, :rigor_mortis_note,
                  livores_mortis_attributes: [:id, :color, :position,
                                              :intensity, :on_finger_pressure],
                  rigores_mortis_attributes: [:id, :joint, :intensity,
                                              :category],
                  examination_attributes: [:note])
  end
end
