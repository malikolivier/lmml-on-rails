class InternalLiverExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_liver_examination)
          .permit(:weight, :hardness, :congestion, :steatosis,
                  gall_bladder_attributes: [:id, :bile_color, :bile_quantity,
                                            :gallstones_quantity,
                                            :gallstones_color,
                                            :gallstones_size],
                  examination_attributes: [:note])
  end
end
