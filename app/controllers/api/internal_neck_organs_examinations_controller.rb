class Api::InternalNeckOrgansExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_neck_organs_examination)
          .permit(:lymph_level, :oesophagus_substance,
                  :oesophagus_substance_quantity,
                  :larynx_substance, :larynx_substance_quantity,
                  :trachea_substance, :trachea_substance_quantity,
                  :main_bronchi_substance, :main_bronchi_substance_quantity,
                  examination_attributes: [:note])
  end
end
