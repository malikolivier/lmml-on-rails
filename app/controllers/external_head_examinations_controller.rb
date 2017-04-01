class ExternalHeadExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_head_examination)
          .permit(:id, :hair_natural_color, :hair_dyed_color,
                  :top_hair_length, :side_hair_length,
                  external_ear_examinations_attributes: %i(id deixis
                                                           bleeding),
                  examination_attributes: [:note])
  end
end
