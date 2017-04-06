class InternalLungsExaminationsController < DualExaminationsController
  private

  def update_params
    params.require(:internal_lungs_examination)
          .permit(:deixis, :weight, :air_content, :congestion,
                  foreign_fluids_attributes: %i[id name color odor
                                                description],
                  examination_attributes: [:note])
  end
end
