class ExternalUpperLimbsExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_upper_limbs_examination)
          .permit(examination_attributes: [:note])
  end
end
