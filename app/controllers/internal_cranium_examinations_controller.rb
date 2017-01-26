class InternalCraniumExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:internal_cranium_examination)
          .permit(examination_attributes: [:note])
  end
end
