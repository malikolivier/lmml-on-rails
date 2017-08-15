class Api::InternalGenitaliaExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_genitalia_examination)
          .permit(:length, :fundal_width, :cervical_width, :endometrium_color,
                  :ovaries_presence, :ovaries_distance,
                  examination_attributes: [:note])
  end
end
