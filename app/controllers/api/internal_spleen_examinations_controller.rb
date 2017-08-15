class Api::InternalSpleenExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_spleen_examination)
          .permit(:weight, :hardness, :congestion, :pulp_distinct,
                  examination_attributes: [:note])
  end
end
