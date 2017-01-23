class ExternalGenitaliaExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_genitalia_examination)
          .permit(:hair_color, :hair_length, :sex,
                  examination_attributes: [:note])
  end
end
