class Api::InternalNeckOrgansExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_neck_organs_examination)
          .permit(:lymph_level, :oesophagus_substance_id,
                  :larynx_substance_id,
                  :trachea_substance_id,
                  :main_bronchi_substance_id,
                  examination_attributes: [:note])
  end
end
