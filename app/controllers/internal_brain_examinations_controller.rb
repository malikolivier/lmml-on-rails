class InternalBrainExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_brain_examination)
          .permit(:weight, :pia_congestion, :blood_spots,
                  examination_attributes: [:note])
  end
end
