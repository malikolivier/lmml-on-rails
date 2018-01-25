class Api::InternalNeckOrgansExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_neck_organs_examination)
          .permit(:lymph_level, :oesophagus_substance_id,
                  :oesophagus_substance_quantity,
                  :larynx_substance_id, :larynx_substance_quantity,
                  :trachea_substance_id, :trachea_substance_quantity,
                  :main_bronchi_substance_id, :main_bronchi_substance_quantity,
                  examination_attributes: [:note])
  end
end
