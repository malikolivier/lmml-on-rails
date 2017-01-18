class ExternalHeadExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_head_examination)
          .permit(:id, :hair_natural_color, :hair_dyed_color,
                  :top_hair_length, :side_hair_length,
                  examination_attributes: [:note])
  end
end
