class ExternalOutlineExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_outline_examination)
          .permit(:id, :sex, :partial_body, :height, :weight, :constitution,
                  :rectal_temperature, :room_temperature)
  end
end
