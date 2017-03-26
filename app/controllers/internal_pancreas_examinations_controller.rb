class InternalPancreasExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_pancreas_examination)
          .permit(:hardness, examination_attributes: [:note])
  end
end
