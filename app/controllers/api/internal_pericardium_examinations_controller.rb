class Api::InternalPericardiumExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_pericardium_examination)
          .permit(:congestion, :petechia,
                  examination_attributes: [:note])
  end
end
