class ExternalTrunkExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_trunk_examination)
          .permit(:abdominal_discoloration, examination_attributes: [:note])
  end
end
