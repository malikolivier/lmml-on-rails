class ExternalLowerLimbsExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_lower_limbs_examination)
          .permit(examination_attributes: [:note])
  end
end
